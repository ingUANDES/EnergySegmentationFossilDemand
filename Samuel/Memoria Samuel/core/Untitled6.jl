import Pkg
Pkg.add("Ipopt")

using JuMP, Ipopt
A = [300, 350, 400, 450, 500]
theta = [0.2, 0.2, 0.2, 0.2, 0.2]
B = 1
I = 90
C = 60
tau = 8760

model = Model(Ipopt.Optimizer)

# Variables
@variable(model, x >= 0)  # Capacidad
@variable(model, Y[1:5] >= 0) # Producción en escenario w
@variable(model, Q[1:5] >= 0) # Demanda en escenario w

# Restricciones
@constraint(model, demanda[i = 1:5], Y[i] == Q[i])
@constraint(model, capacidad[i = 1:5], Y[i] - x <= 0)

# Función Objetivo
@objective(model, Min, I*1000*x + tau * sum(theta[i] * (C * Y[i] - A[i] * Q[i] + B * 0.5 * Q[i]^2) for i = 1:5))



optimize!(model)

# Resultados
println("Q = ", value.(Q))
Qlist = value.(Q)

j = 1
P = []
while j < 6
    Pi = A[j] - B * Qlist[j]
    append!(P, Pi)
    j = j + 1
end
println("P = ", P)
println("x = ", value(x))


