*cap and trade model

*Periods between 2019-2050


*version 14 ---- Noviembre 2019   CALIBRACION FELIPE

*****no positive variables explicitly defined*****
***** technology change factor included
***** investment in first and second stage included
***** discount factors included
***** capacity factor defined as a parameter
***** producer set according to CNE classification
***** limit in investment due to resource potential
***** construction times added

***** periods in second stage (tau2) extended to 2050
***** demand from linear extrapolation of the data from energiaabierta.cl


***** QUADRATIC COST FUNCTION, ACCORDING TO https://www.cne.cl/wp-content/uploads/2019/03/Res.-Ext.-N%C2%B0-207-Informe-costos-de-generaci%C3%B3n-2019.pdf

***** data from file costos.xls


*********************************************************************************

Sets

tau first stage periods /2018/
tau2 second stage periods /2019*2050/
tau3(tau2) second stage investment allowed /2019*2050/
w possible scenarios /1,2,3,4,5/
i producers (technologies)
/
Biomasa,
Carbon,
Eolica,
Gas,
Geotermica,
HidroEmbalse,
HidroPasada,
HidroMiniPasada,
PetroleoDiesel,
Solar
*SolarCSP
/


* PLAZOS DE CONSTRUCCION Y PUESTA EN SERVICIO (AÑOS)
*Biomasa = 3
*Carbon = 4
*Eolica = 2
*Gas = 2
*Geotermica = 4
*HidroEmbalse = 6
*HidroPasada = 5
*HidroMiniPasada = 3
*PetroleoDiesel = 2
*Solar = 1


tau_i(i,tau2) Set of years by technology for which investment is allowed GIVEN the Investment time pre-defined
/Biomasa.(2019*2047),
Carbon.(2019*2046),
Eolica.(2019*2048),
Gas.(2019*2048),
Geotermica.(2019*2046),
HidroEmbalse.(2019*2044),
HidroPasada.(2019*2045),
HidroMiniPasada.(2019*2047),
PetroleoDiesel.(2019*2048),
Solar.(2019*2049)
/

tau2_i(i,tau2)  No puedo producir el los ultimos N periodos
/Biomasa.(2048*2050),
Carbon.(2047*2050),
Eolica.(2049*2050),
Gas.(2049*2050),
Geotermica.(2047*2050),
HidroEmbalse.(2045*2050),
HidroPasada.(2046*2050),
HidroMiniPasada.(2048*2050),
PetroleoDiesel.(2049*2050),
Solar.(2050)
/

tau3_i(i,tau2,tau3) Periodos desde CUANDO puedo producir y esta disponible
/Biomasa.2022.(2019), Biomasa.2023.(2019*2020), Biomasa.2024.(2019*2021), Biomasa.2025.(2019*2022), Biomasa.2026.(2019*2023),
Biomasa.2027.(2019*2024), Biomasa.2028.(2019*2025),Biomasa.2029.(2019*2026),Biomasa.2030.(2019*2027),Biomasa.2031.(2019*2028),
Biomasa.2032.(2019*2029),Biomasa.2033.(2019*2030),Biomasa.2034.(2019*2031),Biomasa.2035.(2019*2032),Biomasa.2036.(2019*2033),
Biomasa.2037.(2019*2034),Biomasa.2038.(2019*2035),Biomasa.2039.(2019*2036),Biomasa.2040.(2019*2037),Biomasa.2041.(2019*2038),
Biomasa.2042.(2019*2039),Biomasa.2043.(2019*2040),Biomasa.2044.(2019*2041),Biomasa.2045.(2019*2042),Biomasa.2046.(2019*2043),
Biomasa.2047.(2019*2044),Biomasa.2048.(2019*2045),Biomasa.2049.(2019*2046),Biomasa.2050.(2019*2047),

Carbon.2023.(2019),Carbon.2024.(2019*2020),Carbon.2025.(2019*2021), Carbon.2026.(2019*2022), Carbon.2027.(2019*2023),
Carbon.2028.(2019*2024),Carbon.2029.(2019*2025),Carbon.2030.(2019*2026),Carbon.2031.(2019*2027),Carbon.2032.(2019*2028),
Carbon.2033.(2019*2029),Carbon.2034.(2019*2030),Carbon.2035.(2019*2031),Carbon.2036.(2019*2032),Carbon.2037.(2019*2033),
Carbon.2038.(2019*2034),Carbon.2039.(2019*2035),Carbon.2040.(2019*2036),Carbon.2041.(2019*2037),Carbon.2042.(2019*2038),
Carbon.2043.(2019*2039),Carbon.2044.(2019*2040),Carbon.2045.(2019*2041),Carbon.2046.(2019*2042),Carbon.2047.(2019*2043),
Carbon.2048.(2019*2044),Carbon.2049.(2019*2045),Carbon.2050.(2019*2046),

Eolica.2021.(2019), Eolica.2022.(2019*2020),Eolica.2023.(2019*2021),Eolica.2024.(2019*2022), Eolica.2025.(2019*2023),
Eolica.2026.(2019*2024),Eolica.2027.(2019*2025), Eolica.2028.(2019*2026),Eolica.2029.(2019*2027),Eolica.2030.(2019*2028),
Eolica.2031.(2019*2029),Eolica.2032.(2019*2030), Eolica.2033.(2019*2031),Eolica.2034.(2019*2032),Eolica.2035.(2019*2033),
Eolica.2036.(2019*2034),Eolica.2037.(2019*2035),Eolica.2038.(2019*2036),Eolica.2039.(2019*2037),Eolica.2040.(2019*2038),
Eolica.2041.(2019*2039),Eolica.2042.(2019*2040),Eolica.2043.(2019*2041),Eolica.2044.(2019*2042),Eolica.2045.(2019*2043),
Eolica.2046.(2019*2044),Eolica.2047.(2019*2045),Eolica.2048.(2019*2046),Eolica.2049.(2019*2047),Eolica.2050.(2019*2048),


Gas.2021.(2019), Gas.2022.(2019*2020),Gas.2023.(2019*2021),Gas.2024.(2019*2022), Gas.2025.(2019*2023),
Gas.2026.(2019*2024),Gas.2027.(2019*2025), Gas.2028.(2019*2026),Gas.2029.(2019*2027),Gas.2030.(2019*2028),
Gas.2031.(2019*2029),Gas.2032.(2019*2030), Gas.2033.(2019*2031),Gas.2034.(2019*2032),Gas.2035.(2019*2033),
Gas.2036.(2019*2034), Gas.2037.(2019*2035),Gas.2038.(2019*2036),Gas.2039.(2019*2037),Gas.2040.(2019*2038),
Gas.2041.(2019*2039),Gas.2042.(2019*2040),Gas.2043.(2019*2041),Gas.2044.(2019*2042),Gas.2045.(2019*2043),
Gas.2046.(2019*2044),Gas.2047.(2019*2045),Gas.2048.(2019*2046),Gas.2049.(2019*2047),Gas.2050.(2019*2048),


Geotermica.2023.(2019), Geotermica.2024.(2019*2020),Geotermica.2025.(2019*2021),Geotermica.2026.(2019*2022), Geotermica.2027.(2019*2023),
Geotermica.2028.(2019*2024),Geotermica.2029.(2019*2025), Geotermica.2030.(2019*2026),Geotermica.2031.(2019*2027),Geotermica.2032.(2019*2028),
Geotermica.2033.(2019*2029),Geotermica.2034.(2019*2030), Geotermica.2035.(2019*2031),Geotermica.2036.(2019*2032),Geotermica.2037.(2019*2033),
Geotermica.2038.(2019*2034),Geotermica.2039.(2019*2035),Geotermica.2040.(2019*2036),Geotermica.2041.(2019*2037),Geotermica.2042.(2019*2038),
Geotermica.2043.(2019*2039),Geotermica.2044.(2019*2040),Geotermica.2045.(2019*2041),Geotermica.2046.(2019*2042),Geotermica.2047.(2019*2043),
Geotermica.2048.(2019*2044),Geotermica.2049.(2019*2045),Geotermica.2050.(2019*2046),


HidroEmbalse.2025.(2019), HidroEmbalse.2026.(2019*2020),HidroEmbalse.2027.(2019*2021),HidroEmbalse.2028.(2019*2022), HidroEmbalse.2029.(2019*2023),
HidroEmbalse.2030.(2019*2024),HidroEmbalse.2031.(2019*2025), HidroEmbalse.2032.(2019*2026),HidroEmbalse.2033.(2019*2027),HidroEmbalse.2034.(2019*2028),
HidroEmbalse.2035.(2019*2029),HidroEmbalse.2036.(2019*2030), HidroEmbalse.2037.(2019*2031), HidroEmbalse.2038.(2019*2032),HidroEmbalse.2039.(2019*2033),
HidroEmbalse.2040.(2019*2034),HidroEmbalse.2041.(2019*2035), HidroEmbalse.2042.(2019*2036),HidroEmbalse.2043.(2019*2037),HidroEmbalse.2044.(2019*2038),
HidroEmbalse.2045.(2019*2039),HidroEmbalse.2046.(2019*2040),HidroEmbalse.2047.(2019*2041),HidroEmbalse.2048.(2019*2042),HidroEmbalse.2049.(2019*2043),
HidroEmbalse.2050.(2019*2044),


HidroPasada.2024.(2019), HidroPasada.2025.(2019*2020),HidroPasada.2026.(2019*2021),HidroPasada.2027.(2019*2022), HidroPasada.2028.(2019*2023),
HidroPasada.2029.(2019*2024),HidroPasada.2030.(2019*2025), HidroPasada.2031.(2019*2026),HidroPasada.2032.(2019*2027),HidroPasada.2033.(2019*2028),
HidroPasada.2034.(2019*2029),HidroPasada.2035.(2019*2030), HidroPasada.2036.(2019*2031),HidroPasada.2037.(2019*2032),HidroPasada.2038.(2019*2033),
HidroPasada.2039.(2019*2034), HidroPasada.2040.(2019*2035),HidroPasada.2041.(2019*2036), HidroPasada.2042.(2019*2037),HidroPasada.2043.(2019*2038),
HidroPasada.2044.(2019*2039), HidroPasada.2045.(2019*2040),HidroPasada.2046.(2019*2041),HidroPasada.2047.(2019*2042),HidroPasada.2048.(2019*2043),
HidroPasada.2049.(2019*2044),HidroPasada.2050.(2019*2045),

HidroMiniPasada.2022.(2019), HidroMiniPasada.2023.(2019*2020),HidroMiniPasada.2024.(2019*2021),HidroMiniPasada.2025.(2019*2022),
HidroMiniPasada.2026.(2019*2023),HidroMiniPasada.2027.(2019*2024),HidroMiniPasada.2028.(2019*2025), HidroMiniPasada.2029.(2019*2026),
HidroMiniPasada.2030.(2019*2027),HidroMiniPasada.2031.(2019*2028),HidroMiniPasada.2032.(2019*2029),HidroMiniPasada.2033.(2019*2030),
HidroMiniPasada.2034.(2019*2031),HidroMiniPasada.2035.(2019*2032),HidroMiniPasada.2036.(2019*2033),HidroMiniPasada.2037.(2019*2034),
HidroMiniPasada.2038.(2019*2035), HidroMiniPasada.2039.(2019*2036), HidroMiniPasada.2040.(2019*2037),HidroMiniPasada.2041.(2019*2038),
HidroMiniPasada.2042.(2019*2039),HidroMiniPasada.2043.(2019*2040), HidroMiniPasada.2044.(2019*2041),HidroMiniPasada.2045.(2019*2042),
HidroMiniPasada.2046.(2019*2043),HidroMiniPasada.2047.(2019*2044),HidroMiniPasada.2048.(2019*2045),HidroMiniPasada.2049.(2019*2046),
HidroMiniPasada.2050.(2019*2047),

PetroleoDiesel.2021.(2019), PetroleoDiesel.2022.(2019*2020),PetroleoDiesel.2023.(2019*2021),PetroleoDiesel.2024.(2019*2022),
PetroleoDiesel.2025.(2019*2023),PetroleoDiesel.2026.(2019*2024),PetroleoDiesel.2027.(2019*2025), PetroleoDiesel.2028.(2019*2026),
PetroleoDiesel.2029.(2019*2027),PetroleoDiesel.2030.(2019*2028),PetroleoDiesel.2031.(2019*2029),PetroleoDiesel.2032.(2019*2030),
PetroleoDiesel.2033.(2019*2031),PetroleoDiesel.2034.(2019*2032),PetroleoDiesel.2035.(2019*2033),PetroleoDiesel.2036.(2019*2034),
PetroleoDiesel.2037.(2019*2035), PetroleoDiesel.2038.(2019*2036), PetroleoDiesel.2039.(2019*2037),PetroleoDiesel.2040.(2019*2038),
PetroleoDiesel.2041.(2019*2039), PetroleoDiesel.2042.(2019*2040), PetroleoDiesel.2043.(2019*2041), PetroleoDiesel.2044.(2019*2042),
PetroleoDiesel.2045.(2019*2043), PetroleoDiesel.2046.(2019*2044), PetroleoDiesel.2047.(2019*2045), PetroleoDiesel.2048.(2019*2046),
PetroleoDiesel.2049.(2019*2047), PetroleoDiesel.2050.(2019*2048),

Solar.2020.(2019), Solar.2021.(2019*2020),Solar.2022.(2019*2021),Solar.2023.(2019*2022), Solar.2024.(2019*2023),
Solar.2025.(2019*2024),Solar.2026.(2019*2025), Solar.2027.(2019*2026),Solar.2028.(2019*2027),Solar.2029.(2019*2028),
Solar.2030.(2019*2029),Solar.2031.(2019*2030), Solar.2032.(2019*2031),Solar.2033.(2019*2032),Solar.2034.(2019*2033),
Solar.2035.(2019*2034), Solar.2036.(2019*2035), Solar.2037.(2019*2036), Solar.2038.(2019*2037), Solar.2039.(2019*2038),
Solar.2040.(2019*2039), Solar.2041.(2019*2040), Solar.2042.(2019*2041), Solar.2043.(2019*2042), Solar.2044.(2019*2043),
Solar.2045.(2019*2044), Solar.2046.(2019*2045), Solar.2047.(2019*2046), Solar.2048.(2019*2047),
Solar.2049.(2019*2048), Solar.2050.(2019*2049)
/

tauAlpha_i(i,tau2,tau3) KKT X_NEXT para duales (alpha) para los años disponibles de X_NEXT
/Biomasa.2047.(2050),Biomasa.2046.(2049*2050),Biomasa.2045.(2048*2050),Biomasa.2044.(2047*2050),Biomasa.2043.(2046*2050),Biomasa.2042.(2045*2050),
Biomasa.2041.(2044*2050),Biomasa.2040.(2043*2050),Biomasa.2039.(2042*2050),Biomasa.2038.(2041*2050),Biomasa.2037.(2040*2050),Biomasa.2036.(2039*2050),
Biomasa.2035.(2038*2050),Biomasa.2034.(2037*2050),Biomasa.2033.(2036*2050),Biomasa.2032.(2035*2050),Biomasa.2031.(2034*2050),Biomasa.2030.(2033*2050),
Biomasa.2029.(2032*2050),Biomasa.2028.(2031*2050),Biomasa.2027.(2030*2050),Biomasa.2026.(2029*2050),Biomasa.2025.(2028*2050),Biomasa.2024.(2027*2050),
Biomasa.2023.(2026*2050),Biomasa.2022.(2025*2050),Biomasa.2021.(2024*2050),Biomasa.2020.(2023*2050),Biomasa.2019.(2022*2050),

Carbon.2046.(2050),Carbon.2045.(2049*2050),Carbon.2044.(2048*2050),Carbon.2043.(2047*2050),Carbon.2042.(2046*2050),
Carbon.2041.(2045*2050),Carbon.2040.(2044*2050),Carbon.2039.(2043*2050),Carbon.2038.(2042*2050),Carbon.2037.(2041*2050),Carbon.2036.(2040*2050),
Carbon.2035.(2039*2050),Carbon.2034.(2038*2050),Carbon.2033.(2037*2050),Carbon.2032.(2036*2050),Carbon.2031.(2035*2050),Carbon.2030.(2034*2050),
Carbon.2029.(2033*2050),Carbon.2028.(2032*2050),Carbon.2027.(2031*2050),Carbon.2026.(2030*2050),Carbon.2025.(2029*2050),Carbon.2024.(2028*2050),
Carbon.2023.(2027*2050),Carbon.2022.(2026*2050),Carbon.2021.(2025*2050),Carbon.2020.(2024*2050),Carbon.2019.(2023*2050),


Eolica.2048.(2050),Eolica.2047.(2049*2050),Eolica.2046.(2048*2050),Eolica.2045.(2047*2050),Eolica.2044.(2046*2050),Eolica.2043.(2045*2050),
Eolica.2042.(2044*2050),Eolica.2041.(2043*2050),Eolica.2040.(2042*2050),Eolica.2039.(2041*2050),Eolica.2038.(2040*2050),Eolica.2037.(2039*2050),
Eolica.2036.(2038*2050),Eolica.2035.(2037*2050),Eolica.2034.(2036*2050),Eolica.2033.(2035*2050),Eolica.2032.(2034*2050),Eolica.2031.(2033*2050),
Eolica.2030.(2032*2050),Eolica.2029.(2031*2050),Eolica.2028.(2030*2050),Eolica.2027.(2029*2050),Eolica.2026.(2028*2050),Eolica.2025.(2027*2050),
Eolica.2024.(2026*2050),Eolica.2023.(2025*2050),Eolica.2022.(2024*2050),Eolica.2021.(2023*2050),Eolica.2020.(2022*2050),Eolica.2019.(2021*2050),

Gas.2048.(2050),Gas.2047.(2049*2050),Gas.2046.(2048*2050),Gas.2045.(2047*2050),Gas.2044.(2046*2050),Gas.2043.(2045*2050),
Gas.2042.(2044*2050),Gas.2041.(2043*2050),Gas.2040.(2042*2050),Gas.2039.(2041*2050),Gas.2038.(2040*2050),Gas.2037.(2039*2050),
Gas.2036.(2038*2050),Gas.2035.(2037*2050),Gas.2034.(2036*2050),Gas.2033.(2035*2050),Gas.2032.(2034*2050),Gas.2031.(2033*2050),Gas.2030.(2032*2050),
Gas.2029.(2031*2050),Gas.2028.(2030*2050),Gas.2027.(2029*2050),Gas.2026.(2028*2050),Gas.2025.(2027*2050),Gas.2024.(2026*2050),
Gas.2023.(2025*2050),Gas.2022.(2024*2050),Gas.2021.(2023*2050),Gas.2020.(2022*2050),Gas.2019.(2021*2050),

Geotermica.2046.(2050),Geotermica.2045.(2049*2050),Geotermica.2044.(2048*2050),Geotermica.2043.(2047*2050),Geotermica.2042.(2046*2050),
Geotermica.2041.(2045*2050),Geotermica.2040.(2044*2050),Geotermica.2039.(2043*2050),Geotermica.2038.(2042*2050),Geotermica.2037.(2041*2050),Geotermica.2036.(2040*2050),
Geotermica.2035.(2039*2050),Geotermica.2034.(2038*2050),Geotermica.2033.(2037*2050),Geotermica.2032.(2036*2050),Geotermica.2031.(2035*2050),Geotermica.2030.(2034*2050),
Geotermica.2029.(2033*2050),Geotermica.2028.(2032*2050),Geotermica.2027.(2031*2050),Geotermica.2026.(2030*2050),Geotermica.2025.(2029*2050),Geotermica.2024.(2028*2050),
Geotermica.2023.(2027*2050),Geotermica.2022.(2026*2050),Geotermica.2021.(2025*2050),Geotermica.2020.(2024*2050),Geotermica.2019.(2023*2050),


HidroEmbalse.2044.(2050),HidroEmbalse.2043.(2049*2050),HidroEmbalse.2042.(2048*2050),HidroEmbalse.2041.(2047*2050),HidroEmbalse.2040.(2046*2050),
HidroEmbalse.2039.(2045*2050),HidroEmbalse.2038.(2044*2050),HidroEmbalse.2037.(2043*2050),HidroEmbalse.2036.(2042*2050),HidroEmbalse.2035.(2041*2050),
HidroEmbalse.2034.(2040*2050),HidroEmbalse.2033.(2039*2050),HidroEmbalse.2032.(2038*2050),HidroEmbalse.2031.(2037*2050),HidroEmbalse.2030.(2036*2050),
HidroEmbalse.2029.(2035*2050),HidroEmbalse.2028.(2034*2050),HidroEmbalse.2027.(2033*2050),HidroEmbalse.2026.(2032*2050),HidroEmbalse.2025.(2031*2050),
HidroEmbalse.2024.(2030*2050),HidroEmbalse.2023.(2029*2050),HidroEmbalse.2022.(2028*2050),HidroEmbalse.2021.(2027*2050),HidroEmbalse.2020.(2026*2050),
HidroEmbalse.2019.(2025*2050),



HidroPasada.2045.(2050),HidroPasada.2044.(2049*2050),HidroPasada.2043.(2048*2050),HidroPasada.2042.(2047*2050),HidroPasada.2041.(2046*2050),
HidroPasada.2040.(2045*2050),HidroPasada.2039.(2044*2050),HidroPasada.2038.(2043*2050),HidroPasada.2037.(2042*2050),HidroPasada.2036.(2041*2050),
HidroPasada.2035.(2040*2050),HidroPasada.2034.(2039*2050),HidroPasada.2033.(2038*2050),HidroPasada.2032.(2037*2050),HidroPasada.2031.(2036*2050),
HidroPasada.2030.(2035*2050),HidroPasada.2029.(2034*2050),HidroPasada.2028.(2033*2050),HidroPasada.2027.(2032*2050),HidroPasada.2026.(2031*2050),
HidroPasada.2025.(2030*2050),HidroPasada.2024.(2029*2050),HidroPasada.2023.(2028*2050),HidroPasada.2022.(2027*2050),HidroPasada.2021.(2026*2050),
HidroPasada.2020.(2025*2050),HidroPasada.2019.(2024*2050),

HidroMiniPasada.2047.(2050),HidroMiniPasada.2046.(2049*2050),HidroMiniPasada.2045.(2048*2050),HidroMiniPasada.2044.(2047*2050),
HidroMiniPasada.2043.(2046*2050),HidroMiniPasada.2042.(2045*2050),HidroMiniPasada.2041.(2044*2050),HidroMiniPasada.2040.(2043*2050),
HidroMiniPasada.2039.(2042*2050),HidroMiniPasada.2038.(2041*2050),HidroMiniPasada.2037.(2040*2050),HidroMiniPasada.2036.(2039*2050),
HidroMiniPasada.2035.(2038*2050),HidroMiniPasada.2034.(2037*2050),HidroMiniPasada.2033.(2036*2050),HidroMiniPasada.2032.(2035*2050),
HidroMiniPasada.2031.(2034*2050),HidroMiniPasada.2030.(2033*2050),HidroMiniPasada.2029.(2032*2050),HidroMiniPasada.2028.(2031*2050),
HidroMiniPasada.2027.(2030*2050),HidroMiniPasada.2026.(2029*2050),HidroMiniPasada.2025.(2028*2050),HidroMiniPasada.2024.(2027*2050),
HidroMiniPasada.2023.(2026*2050),HidroMiniPasada.2022.(2025*2050),HidroMiniPasada.2021.(2024*2050),HidroMiniPasada.2020.(2023*2050),
HidroMiniPasada.2019.(2022*2050),

PetroleoDiesel.2048.(2050),PetroleoDiesel.2047.(2049*2050),PetroleoDiesel.2046.(2048*2050),PetroleoDiesel.2045.(2047*2050),PetroleoDiesel.2044.(2046*2050),PetroleoDiesel.2043.(2045*2050),
PetroleoDiesel.2042.(2044*2050),PetroleoDiesel.2041.(2043*2050),PetroleoDiesel.2040.(2042*2050),PetroleoDiesel.2039.(2041*2050),PetroleoDiesel.2038.(2040*2050),PetroleoDiesel.2037.(2039*2050),
PetroleoDiesel.2036.(2038*2050),PetroleoDiesel.2035.(2037*2050),PetroleoDiesel.2034.(2036*2050),PetroleoDiesel.2033.(2035*2050),PetroleoDiesel.2032.(2034*2050),PetroleoDiesel.2031.(2033*2050),
PetroleoDiesel.2030.(2032*2050),PetroleoDiesel.2029.(2031*2050),PetroleoDiesel.2028.(2030*2050),PetroleoDiesel.2027.(2029*2050),PetroleoDiesel.2026.(2028*2050),PetroleoDiesel.2025.(2027*2050),
PetroleoDiesel.2024.(2026*2050),PetroleoDiesel.2023.(2025*2050),PetroleoDiesel.2022.(2024*2050),PetroleoDiesel.2021.(2023*2050),PetroleoDiesel.2020.(2022*2050),PetroleoDiesel.2019.(2021*2050),


Solar.2049.(2050),Solar.2048.(2049*2050),Solar.2047.(2048*2050),Solar.2046.(2047*2050),Solar.2045.(2046*2050),Solar.2044.(2045*2050),
Solar.2043.(2044*2050),Solar.2042.(2043*2050),Solar.2041.(2042*2050),Solar.2040.(2041*2050),Solar.2039.(2040*2050),Solar.2038.(2039*2050),
Solar.2037.(2038*2050),Solar.2036.(2037*2050),Solar.2035.(2036*2050),Solar.2034.(2035*2050),Solar.2033.(2034*2050),Solar.2032.(2033*2050),Solar.2031.(2032*2050),
Solar.2030.(2031*2050),Solar.2029.(2030*2050),Solar.2028.(2029*2050),Solar.2027.(2028*2050),Solar.2026.(2027*2050),Solar.2025.(2026*2050),
Solar.2024.(2025*2050),Solar.2023.(2024*2050),Solar.2022.(2023*2050),Solar.2021.(2022*2050),Solar.2020.(2021*2050),Solar.2019.(2020*2050)
/



alias(i,j)
alias(t,tau2)
;
display tau3_i;



**********************************************************************************************************

Positive Variables

****** Producers are able to invest in capacity several times during second stage
x_first(i)               first capacity investment decision
x_next(i,tau2,w)         next capacity investment decision
***********************************************************

Q_first(i,tau)           produced quantity in first stage in MWh
Q_second(i,tau2,w)       produced quantity in second stage in MWh
A(i)                     emissions allowances
V(i,w)                   sold permits
P(i,j,w)                 purchased permits
pi_a                     dual to CAP constraint
*pi_t(i,w) dual to trading equilibrium
pi_d(tau)                dual to demand equilibrium in first stage
pi2_d(tau2,w)            dual to demand equilibrium in second stage

pi_v(j,w)                price of sold permits per producer

***lagrange multipliers
*producer
alpha(i,w,tau2)          dual to second stage capacity constraint
kappa(i,tau)             dual to first stage capacity constraint
beta(i,w)                dual to sold allowances
gamma(i,w)               dual to total allowances in the market
delta(i,tau2,w)          dual to capacity feasibility tau2
lambda(i,tau)            dual to capacity feasibility tau1

psi(i,w)

xi(i)
varphi(i,w,tau2)

**************************************************************
u(i,w,tau2)                     dual to capacity expansion first
**************************************************************




*auctioneer
eta                      dual to allowances constraints
mu                       dual to allowances feasibility



*ad(i)
*pd(i,j,w)
*vd(i,w)
*xd(i)
*auctioneer
theta                    allowances regulated by the auctioneer
;


Parameters
Q_bar(i)                 maximum operation capacity
Inv(i)                   expansion cost in dollar per kilowatt
C(i)                     Marginal operation cost in dollar per kilowatt
int(i)                   Fix cost of generator I (% of inv cost)
D2(w,tau2)               total demand in kilowatt per hour
PhiRisk                  margin for total emission allowances
epsilon(i)               emission factor of producer i
Prob(w)                  physical probability
Std                      standard deviation normal distribution
mean                     mean of the normal distribution
D1(tau)                  demand in first stage
R                        discount rate
CF(i)                    Capacity factor
t_year                   hours in a year

RP(i)                    Resource potential per technology in MW
Q_barT2(i,tau2)            Given investment desicions.
percent(i)               percentage of the investment (fix cost)

***************************************************************
*TC(i,tau2)                    Technology change
*TCR(i,tau2)                   Technology change recoursive
;

PhiRisk = 0.9;
Std = 0;
*cap maximo
mean =100000000;       
Prob('1') = 0.2;
Prob('2') = 0.2;
Prob('3') = 0.2;
Prob('4') = 0.2;
Prob('5') = 0.2;

R = 0.01;
t_year=8760;



Table TC(i,tau2)       change in cost of operation
                 2019        2020        2021        2022        2023        2024        2025        2026        2027        2028        2029        2030        2031        2032        2033        2034        2035        2036        2037        2038        2039        2040        2041        2042        2043        2044        2045        2046        2047        2048        2049        2050
Biomasa          1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00
Carbon           0.99        0.97        0.95        0.95        0.90        0.88        0.88        0.88        0.88        0.88        0.84        0.82        0.80        0.77        0.75        0.73        0.72        0.70        0.68        0.67        0.66        0.65        0.65        0.65        0.64        0.62        0.60        0.60        0.60        0.60        0.60        0.60
Eolica           1.00        0.97        0.94        0.91        0.75        0.70        0.65        0.60        0.55        0.50        0.45        0.40        0.35        0.30        0.28        0.28        0.28        0.22        0.19        0.18        0.16        0.14        0.14        0.14        0.13        0.11        0.10        0.09        0.08        0.07        0.06        0.05
Gas              1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00
Geotermica       1.00        0.99        0.98        0.97        0.96        0.95        0.94        0.93        0.92        0.91        0.90        0.90        0.89        0.88        0.87        0.86        0.85        0.84        0.83        0.83        0.82        0.81        0.80        0.79        0.79        0.78        0.77        0.75        0.70        0.60        0.50        0.40
HidroEmbalse     1.00        0.97        0.94        0.91        0.89        0.86        0.83        0.81        0.78        0.76        0.74        0.72        0.69        0.67        0.65        0.63        0.62        0.60        0.59        0.57        0.56        0.50        0.50        0.45        0.45        0.40        0.30        0.25        0.20        0.15        0.10        0.10
HidroPasada      1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.02        1.02        1.02        1.00        1.00        1.00        1.00        1.00        1.00        1.00        0.95        0.95        0.95
HidroMiniPasada  1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.02        1.02        1.02        1.02        1.02        1.02        1.00        1.00        1.00        1.00        1.00        0.95        0.95
PetroleoDiesel   1.00        0.97        0.94        0.91        0.89        0.86        0.83        0.81        0.78        0.76        0.74        0.72        0.69        0.67        0.65        0.63        0.62        0.60        0.59        0.57        0.56        0.54        0.53        0.52        0.50        0.48        0.46        0.44        0.42        0.40        0.39        0.37
Solar            1.00        0.97        0.94        0.90        0.82        0.75        0.65        0.55        0.45        0.35        0.30        0.28        0.26        0.25        0.24        0.22        0.21        0.20        0.18        0.17        0.15        0.14        0.12        0.10        0.09        0.08        0.07        0.06        0.05        0.04        0.03        0.02
;






Table TCR(i,tau2)       Change in cost of investment
                         2019  2020  2021  2022  2023  2024  2025  2026  2027  2028  2029  2030  2031  2032  2033  2034  2035  2036  2037  2038  2039  2040  2041  2042  2043  2044  2045  2046  2047  2048  2049  2050
Biomasa                  1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   0.18  0.17  0.10  0.10  0.10
Carbon                   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0
Eolica                   1.00  0.95  0.90  0.86  0.81  0.77  0.74  0.70  0.66  0.63  0.60  0.57  0.54  0.51  0.49  0.46  0.44  0.42  0.40  0.38  0.36  0.34  0.32  0.31  0.30  0.25  0.25  0.20  0.20  0.20  0.20  0.20
Gas                      1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0
Geotermica               1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0
HidroEmbalse             1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   0.45  0.45  0.45  0.45  0.45  0.45  0.45  0.45  0.45
HidroPasada              1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   0.45  0.45  0.45  0.45  0.45  0.45  0.45  0.45  0.45
HidroMiniPasada          1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   0.45  0.45  0.45  0.45  0.45  0.45  0.45  0.45  0.45
PetroleoDiesel           1.00  1.02  1.04  1.06  1.08  1.10  1.13  1.15  1.17  1.20  1.22  1.24  1.27  1.29  1.32  1.35  1.00  1.00  1.00  1.00  1.00  1.00  1.00  1.00  1.00  1.00  1.00  1.00  1.00  1.00  1.00  1.00
Solar                    1.00  0.95  0.90  0.86  0.81  0.77  0.74  0.70  0.66  0.63  0.60  0.57  0.54  0.51  0.49  0.46  0.44  0.42  0.40  0.38  0.36  0.34  0.33  0.32  0.31  0.28  0.25  0.18  0.17  0.10  0.10  0.10
;





**INITIAL INVESTMENT USD/MW

** Data from Informe Anual de costo de operaciones CNE 2019

Inv('Biomasa')= 3253000;
Inv('Carbon')= 3000000;
Inv('Eolica')= 1361000;
Inv('Gas')=800000;
Inv('Geotermica')= 5870000;
Inv('HidroEmbalse')= 2180000;
Inv('HidroPasada') =4050000;
Inv('HidroMiniPasada')=3565000;
Inv('PetroleoDiesel')= 687000;
Inv('Solar')= 2000000;

***Inv('SolarCSP')=6055000;

** FIX COST PERCENTAGE OF INVESTMENT
percent('Biomasa')= 0.025;
percent('Carbon')=0.01;
percent('Eolica')= 0.03;
percent('Gas')= 0.01;
percent('Geotermica')= 0.04;
percent('HidroEmbalse')= 0.01;
percent('HidroPasada') =0.01;
percent('HidroMiniPasada')=0.01;
percent('PetroleoDiesel')=0.01;
percent('Solar')= 0.04;





** CAPACITY FACTORS

CF('Biomasa')= 0.55;
CF('Carbon')=0.99;
CF('Eolica')= 0.23;
CF('Gas')= 0.6;
CF('Geotermica')= 0.65;
CF('HidroEmbalse')= 0.39;
CF('HidroPasada') =0.43;
CF('HidroMiniPasada')=0.39;
CF('PetroleoDiesel')=0.9;
CF('Solar')= 0.24;


***DATA from _Bergen & Muñoz 2018, table 2-- Santana et al. 2014 Table 44
***values given per year, scaled to our period range
***in MW
***TOTAL PERIOD RANGE = 32 years

RP('Biomasa')= 2000*32;
RP('Carbon')=1000000000000000;
RP('Eolica')= 37477*32;
RP('Gas')= 1000000000000000;
RP('Geotermica')= 662*32;
RP('HidroEmbalse')= 4521*32;
RP('HidroPasada') =4293*32;
RP('HidroMiniPasada')=3958*32;
RP('PetroleoDiesel')=1000000000000000;
RP('Solar')= 1263407*32;


*INSTALLED CAPACITY IN MW
** Data from Energia Abierta

Q_bar('Biomasa')= 506.78;
Q_bar('Carbon')= 5146.76;
Q_bar('Eolica')=1926.42;
Q_bar('Gas')= 4947.9;
Q_bar('Geotermica')= 39.7;
Q_bar('HidroEmbalse')= 3354.64;
Q_bar('HidroPasada') =2811.88;
Q_bar('HidroMiniPasada')=549.07;
Q_bar('PetroleoDiesel')= 3193.99;
Q_bar('Solar')= 2594.04;
**Q_bar('SolasCSP')=0;


** COST OF OPERATION USD/MWh  *** MARGINAL COST ***
** STEEP TERM IN MARGINAL COST FUNCTION

C('Biomasa')= 1.96933833671687E-06;
C('Carbon')= 1.33303524353771E-06;
C('Eolica')= 9.99458928846788E-06;
C('Gas')= 3.902380826484435E-06;
C('Geotermica')=0;
C('HidroEmbalse')= 3.39441468056401E-06;
C('HidroPasada') =3.59657572455631E-06;
C('HidroMiniPasada')=2.098554787741294E-05;
C('PetroleoDiesel')=0.000145855322005;
C('Solar')= 5.99258864134709E-06;





*** FIX COST
*** INTERCEPT IN MARGINAL COST FUNCTION
int('Biomasa')= 9.43;
int('Carbon')= 3.42;
int('Eolica')= 9.9;
int('Gas')= 0.91;
int('Geotermica')=10.80;
int('HidroEmbalse')= 6.49;
int('HidroPasada') =4.62;
int('HidroMiniPasada')=4.07;
int('PetroleoDiesel')= 0.78;
int('Solar')= 9.13;

****

epsilon('Biomasa')= 0;
epsilon('Carbon')= 0.91;
epsilon('Eolica')= 0;
epsilon('Gas')= 0.65;
epsilon('Geotermica')= 0;
epsilon('HidroEmbalse')= 0;
epsilon('HidroPasada') =0;
epsilon('HidroMiniPasada')=0;
epsilon('PetroleoDiesel')= 0.91;
epsilon('Solar')= 0;
*epsilon('SolarCSP')= 0;

** discount rate of 7%


***********************************************************************
* NO CAP-AND-TRADE IN THE MODEL
* COMMENT THIS BOX IF YOU DO NOT WANT NO C&T MODEL

*theta.fx=0;
*epsilon(i)=0;
***********************************************************************




***PROJECTED DEMAND 2019-2037 CNE DATA  MWh
*** Data 2017-2018 ResExt CNE

**D1('2017')=68904261;

**** Data 2018 from Proyeccion de Demanda CNE (extrapolado)
D1('2018')=69585630;

*D1('2018')=70000000;



D2('1','2019')=86506469.5;       D2('2','2019')=90942698.7;       D2('3','2019')=85767098;         D2('4','2019')=99075785.6;       D2('5','2019')=83548983.4;
D2('1','2020')=90203327.2;       D2('2','2020')=95378927.9;       D2('3','2020')=89463955.6;       D2('4','2020')=104250000;        D2('5','2020')=87985212.6;
D2('1','2021')=93900184.8;       D2('2','2021')=99815157.1;       D2('3','2021')=93900184.8;       D2('4','2021')=107950000;        D2('5','2021')=92421441.8;
D2('1','2022')=99075785.6;       D2('2','2022')=105730000;        D2('3','2022')=98336414;         D2('4','2022')=115340000;        D2('5','2022')=96857671;
D2('1','2023')=102030000;        D2('2','2023')=109430000;        D2('3','2023')=102030000;        D2('4','2023')=117560000;        D2('5','2023')=99815157.1;
D2('1','2024')=107950000;        D2('2','2024')=115340000;        D2('3','2024')=107950000;        D2('4','2024')=121260000;        D2('5','2024')=105730000;
D2('1','2025')=114600000;        D2('2','2025')=120520000;        D2('3','2025')=115340000;        D2('4','2025')=125690000;        D2('5','2025')=110170000;
D2('1','2026')=116820000;        D2('2','2026')=122740000;        D2('3','2026')=118300000;        D2('4','2026')=127910000;        D2('5','2026')=110910000;
D2('1','2027')=121260000;        D2('2','2027')=127170000;        D2('3','2027')=121260000;        D2('4','2027')=132350000;        D2('5','2027')=114600000;
D2('1','2028')=123480000;        D2('2','2028')=128650000;        D2('3','2028')=124210000;        D2('4','2028')=136780000;        D2('5','2028')=116080000;
D2('1','2029')=124950000;        D2('2','2029')=130870000;        D2('3','2029')=130130000;        D2('4','2029')=139740000;        D2('5','2029')=116820000;
D2('1','2030')=128650000;        D2('2','2030')=133830000;        D2('3','2030')=132350000;        D2('4','2030')=143440000;        D2('5','2030')=120520000;
D2('1','2031')=131610000;        D2('2','2031')=137520000;        D2('3','2031')=136040000;        D2('4','2031')=147870000;        D2('5','2031')=122740000;
D2('1','2032')=134570000;        D2('2','2032')=139740000;        D2('3','2032')=140480000;        D2('4','2032')=151570000;        D2('5','2032')=124210000;
D2('1','2033')=136780000;        D2('2','2033')=142700000;        D2('3','2033')=142700000;        D2('4','2033')=156010000;        D2('5','2033')=125690000;
D2('1','2034')=139740000;        D2('2','2034')=145660000;        D2('3','2034')=146400000;        D2('4','2034')=158960000;        D2('5','2034')=127170000;
D2('1','2035')=141220000;        D2('2','2035')=147870000;        D2('3','2035')=148610000;        D2('4','2035')=162660000;        D2('5','2035')=129390000;
D2('1','2036')=143440000;        D2('2','2036')=150090000;        D2('3','2036')=151570000;        D2('4','2036')=165620000;        D2('5','2036')=130870000;
D2('1','2037')=145660000;        D2('2','2037')=152310000;        D2('3','2037')=156010000;        D2('4','2037')=168580000;        D2('5','2037')=133090000;
D2('1','2038')=147130000;        D2('2','2038')=155270000;        D2('3','2038')=159700000;        D2('4','2038')=171530000;        D2('5','2038')=135300000;
D2('1','2039')=148610000;        D2('2','2039')=156750000;        D2('3','2039')=163400000;        D2('4','2039')=173750000;        D2('5','2039')=136780000;
D2('1','2040')=149350000;        D2('2','2040')=158960000;        D2('3','2040')=166360000;        D2('4','2040')=175970000;        D2('5','2040')=138260000;
D2('1','2041')=151570000;        D2('2','2041')=161180000;        D2('3','2041')=170060000;        D2('4','2041')=178190000;        D2('5','2041')=140480000;
D2('1','2042')=153050000;        D2('2','2042')=163400000;        D2('3','2042')=173010000;        D2('4','2042')=180410000;        D2('5','2042')=141960000;
D2('1','2043')=155270000;        D2('2','2043')=165620000;        D2('3','2043')=175970000;        D2('4','2043')=183360000;        D2('5','2043')=143440000;
D2('1','2044')=156010000;        D2('2','2044')=167840000;        D2('3','2044')=178190000;        D2('4','2044')=185580000;        D2('5','2044')=144920000;
D2('1','2045')=158230000;        D2('2','2045')=169320000;        D2('3','2045')=181150000;        D2('4','2045')=187800000;        D2('5','2045')=146400000;
D2('1','2046')=158960000;        D2('2','2046')=171530000;        D2('3','2046')=184840000;        D2('4','2046')=190020000;        D2('5','2046')=147130000;
D2('1','2047')=160440000;        D2('2','2047')=172270000;        D2('3','2047')=187060000;        D2('4','2047')=192240000;        D2('5','2047')=147130000;
D2('1','2048')=161920000;        D2('2','2048')=173750000;        D2('3','2048')=189280000;        D2('4','2048')=194450000;        D2('5','2048')=147870000;
D2('1','2049')=163400000;        D2('2','2049')=174490000;        D2('3','2049')=191500000;        D2('4','2049')=197410000;        D2('5','2049')=148610000;
D2('1','2050')=164880000;        D2('2','2050')=175230000;        D2('3','2050')=192980000;        D2('4','2050')=199630000;        D2('5','2050')=148610000;








Table Q_barT2(i,tau2)       Given investment choices
                 2019  2020  2021  2022  2023  2024  2025  2026  2027  2028  2029  2030  2031  2032  2033  2034  2035  2036  2037  2038  2039  2040  2041  2042  2043  2044  2045  2046  2047  2048  2049  2050
Biomasa          5.5   0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
Carbon           0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
Eolica           224.4 288   78.1  0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
Gas              50    0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
Geotermica       0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
HidroEmbalse     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
HidroPasada      53.4  726   6.5   136   0     170   0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
HidroMiniPasada  0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
PetroleoDiesel   284   266.9 0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
Solar            269.4 351.5 0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
;







Equations
*kkt producer
*kkt_x_producer(i)                 kkt of capacity expansion
*******************************************************************
kkt_x_first_producer(i)            kkt of first stage capacity expansion
kkt_x_second_producer(i,tau2,w)    kkt of second stage capacity expansion
*******************************************************************

kkt_q1_producer(i,tau)            kkt of present operation quantity
kkt_A_producer(i)                 kkt of allowances
kkt_qtau_producer(i,tau2,w)       kkt of quantity of operation in stage 2
kkt_V_producer(i,w)               kkt of sold permits
kkt_P_producer(i,j,w)             kkt of purchased permits

*constraints producer
capacity_stage_1(i,tau)
capacity_stage_2(i,w,tau2)
trading_permits(i,w)
total_allowances(i,w)


resource_potential(i,w)

******************************************************************************
*capacity_stage_2_x1(i,w,tau2)
capacity_stage_2_xnext(i,w,tau2)
******************************************************************************

***Variable domain
*x_positive(i)
q1positive(i,tau)
q2positive(i,tau2,w)
x_first_positive(i)
x_next_positive(i,w,tau2)
thetaPositive
*A_positive(i)
*P_positive(i,j,w)
*V_positive(i,w)


*auctionner
kkt_auctioneer                   kkt of auctioneer
theta_const                      constraint for theta variable

*market clearing conditions
kkt_A_theta                      available allowances
kkt_P_V(i,w)                     trading equilibrium
kkt_Q_D_first(tau)               fulfilment of the demand first stage
kkt_Q_D_second(tau2,w)           fulfilment of the demand second stage
;


*kkt_x_producer(i)..                              Inv(i)- sum(w, sum( tau2,alpha(i,w,tau2))) - xd(i) =e= 0;
*kkt_x_producer(i)..                              Inv(i)- sum(w, sum( tau2,alpha(i,w,tau2))) =g= 0;

*******************************************************************************************************************
** KKT EQUATIONS FROM LAGRANGIAN  (PRODUCERS)

kkt_x_first_producer(i)..                        Inv(i)*(1+percent(i)) + sum(w, psi(i,w))- CF(i)*t_year*sum(w, sum( tau2,alpha(i,w,tau2))) - xi(i)=g=0;

****** discount factor added for tau>1
kkt_x_second_producer(i,tau2,w)..  ((1/(1+R))**(ord(tau2)))*Prob(w)*Inv(i)*(1+percent(i))*TCR(i,tau2)- CF(i)*t_year*sum(tau3$(tauAlpha_i(i,tau2,tau3)),alpha(i,w,tau3)) + psi(i,w) -varphi(i,w,tau2)  =g=0;


kkt_q1_producer(i,tau)..                         (int(i)+C(i)*Q_first(i,tau))-pi_d(tau) + kappa(i,tau) - lambda(i,tau)+sum(w,gamma(i,w)*epsilon(i))=g= 0;

kkt_qtau_producer(i,tau2,w)..                    ((1/(1+R))**(ord(tau2)))*Prob(w)*((TC(i,tau2)*(int(i)+C(i)*Q_second(i,tau2,w)))-pi2_d(tau2,w))+alpha(i,w,tau2)+gamma(i,w)*epsilon(i)-delta(i,tau2,w) =g= 0;
*kkt_A_producer(i)..                              sum(w, pi_a- beta(i,w) - gamma(i,w)) -ad(i)=g= 0;
kkt_A_producer(i)..                              pi_a - sum(w, beta(i,w)) - sum(w, gamma(i,w))=g= 0;

*kkt_V_producer(i,w)..                            -Prob(w)*pi_v(i,w)+beta(i,w)+gamma(i,w) -vd(i,w)=g= 0;
kkt_V_producer(i,w)..                            -Prob(w)*pi_v(i,w)+beta(i,w)+gamma(i,w)=g= 0;

*kkt_P_producer(i,j,w)$(ord(j) <> ord(i))..       Prob(w)* pi_v(j,w)-gamma(i,w) - pd(i,j,w) =g= 0;
kkt_P_producer(i,j,w)$(ord(j) <> ord(i))..      Prob(w)* pi_v(j,w)-gamma(i,w) =g= 0;






q1positive(i,tau)..                      Q_first(i,tau)=g=0;
q2positive(i,tau2,w)..                   Q_second(i,tau2,w)=g=0;

x_first_positive(i)..                    x_first(i)=g= 0;
x_next_positive(i,w,tau2)..              x_next(i,tau2,w) =g= 0;

*A_positive(i)..                          A(i) =g=0;
*P_positive(i,j,w)$(ord(j) <> ord(i))..   P(i,j,w) =g=0;
*V_positive(i,w)..                          V(i,w)=g=0;
*x_positive(i)..                           x(i)=g=0;


***************************************************************************************************************************
** CAPACITY CONSTRAINTS  (PRODUCERS)

*capacity_stage_2_x1(i,w,tau2)..                  x_first(i)-Q_second(i,tau2,w)+Q_bar(i) =g= 0;
*capacity_stage_2_xnext(i,w,tau2)$tau_i(i,tau2)..       CF(i)*t_year*(sum(t$(ord(t) < ord(tau2)),x_next(i,t,w))+x_first(i)+Q_barT2(i,tau2) +Q_bar(i))-Q_second(i,tau2,w) =g=0;
capacity_stage_2_xnext(i,w,tau2)..       CF(i)*t_year*(sum(tau3$(tau3_i(i,tau2,tau3)),x_next(i,tau3,w))+x_first(i)+Q_barT2(i,tau2) +Q_bar(i))-Q_second(i,tau2,w) =g=0;



*capacity_stage_2(i,w,tau2)..             x(i)-Q_second(i,tau2,w)+Q_bar(i) =g= 0;
capacity_stage_1(i,tau)..                CF(i)*t_year*Q_bar(i)- Q_first(i,tau) =g=0;
trading_permits(i,w)..                   A(i)-V(i,w) =g= 0;
total_allowances(i,w)..                  A(i) + sum(j$(ord(j) <> ord(i)),P(i,j,w))-V(i,w) - sum(tau2,Q_second(i,tau2,w)*epsilon(i)) - sum(tau,Q_first(i,tau)*epsilon(i))   =g= 0;

resource_potential(i,w)..                -Q_bar(i) - x_first(i) - sum(tau3,x_next(i,tau3,w))+sum(tau2,Q_barT2(i,tau2)) + RP(i) =g= 0;


**MARKET CLEARING CONSTRAINTS

kkt_A_theta..                            theta - sum(i,A(i))=e= 0;
*kkt_P_V(w)..                            sum(i,P(i,w))=e=sum(i,V(i,w));
kkt_Q_D_first(tau)..                     sum(i,Q_first(i,tau))=e=D1(tau);
kkt_Q_D_second(tau2,w)..                 sum(i,Q_second(i,tau2,w))=e=D2(w,tau2);

kkt_P_V(i,w)..                           V(i,w)=e=sum(j$(ord(j) <> ord(i)),P(j,i,w));

** KKT for AUCTIONEER
kkt_auctioneer..                         -pi_a + eta - mu =g=0;
theta_const..                            -theta + PhiRisk*(Std)+mean =g= 0;
thetaPositive..                           theta=g=0;


Model capntrade /
*kkt_x_producer.x

kkt_x_first_producer.x_first
kkt_x_second_producer.x_next


kkt_q1_producer.Q_first
kkt_qtau_producer.Q_second
kkt_A_producer.A
kkt_V_producer.V
kkt_P_producer.P

capacity_stage_1.kappa
*capacity_stage_2.alpha
********************************************
*capacity_stage_2_x1.u

capacity_stage_2_xnext.alpha
*******************************************
resource_potential.psi


trading_permits.beta
total_allowances.gamma
q1positive.lambda
q2positive.delta
x_first_positive.xi
x_next_positive.varphi

kkt_A_theta.pi_a
kkt_P_V.pi_v
kkt_Q_D_first.pi_d
kkt_Q_D_second.pi2_d

kkt_auctioneer.theta
theta_const.eta
thetaPositive.mu



*A_positive.ad
*P_positive.pd
*V_positive.vd
*x_positive.xd
/;


***RESOURCE POTENTIAL PER YEAR
Q_second.up('Biomasa',tau2,w)=2000*t_year*CF('Biomasa');
Q_second.up('Eolica',tau2,w)=37477*t_year*CF('Eolica');
Q_second.up('Geotermica',tau2,w)=662*t_year*CF('Geotermica');
Q_second.up('HidroEmbalse',tau2,w)=4521*t_year*CF('HidroEmbalse');
Q_second.up('HidroPasada',tau2,w)=4293*t_year*CF('HidroPasada');
Q_second.up('HidroMiniPasada',tau2,w)=3958*t_year*CF('HidroMiniPasada');
Q_second.up('Solar',tau2,w)=1263407*t_year*CF('Solar');

x_first.up(i)=0;
*FIX VARIABLES DUE TO INCOMPLETE INVESTMENT PATTERN
x_next.fx(i,tau2,w)$tau2_i(i,tau2)=0;


A.fx('Solar')=0;
A.fx('Eolica')=0;
A.fx('Biomasa')=0;
A.fx('Geotermica')=0;
A.fx('HidroEmbalse')=0;
A.fx('HidroPasada')=0;
A.fx('HidroMiniPasada')=0;

V.fx('Solar','1')=0;
V.fx('Eolica','1')=0;
V.fx('Biomasa','1')=0;
V.fx('Geotermica','1')=0;
V.fx('HidroEmbalse','1')=0;
V.fx('HidroPasada','1')=0;
V.fx('HidroMiniPasada','1')=0;

V.fx('Solar','2')=0;
V.fx('Eolica','2')=0;
V.fx('Biomasa','2')=0;
V.fx('Geotermica','2')=0;
V.fx('HidroEmbalse','2')=0;
V.fx('HidroPasada','2')=0;
V.fx('HidroMiniPasada','2')=0;

V.fx('Solar','3')=0;
V.fx('Eolica','3')=0;
V.fx('Biomasa','3')=0;
V.fx('Geotermica','3')=0;
V.fx('HidroEmbalse','3')=0;
V.fx('HidroPasada','3')=0;
V.fx('HidroMiniPasada','3')=0;

V.fx('Solar','4')=0;
V.fx('Eolica','4')=0;
V.fx('Biomasa','4')=0;
V.fx('Geotermica','4')=0;
V.fx('HidroEmbalse','4')=0;
V.fx('HidroPasada','4')=0;
V.fx('HidroMiniPasada','4')=0;

V.fx('Solar','5')=0;
V.fx('Eolica','5')=0;
V.fx('Biomasa','5')=0;
V.fx('Geotermica','5')=0;
V.fx('HidroEmbalse','5')=0;
V.fx('HidroPasada','5')=0;
V.fx('HidroMiniPasada','5')=0;

*display tau2_i
option mcp = path;
option limrow = 100000 ;
solve capntrade using mcp;
execute_unload "cnt_2050_total_cap_test_seba_scenarios.gdx"
display Q_second.L;
*display


