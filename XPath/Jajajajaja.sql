USE TeleMostachon
GO
SELECT M.ID AS "@id",IDPedido,TipoBase,Harina,
	C.ID AS "cliente/@id", C.Nombre AS "cliente/nombre", C.Apellidos As "cliente/apellidos", C.Ciudad AS "cliente/ciudad"
  FROM TMMostachones AS M
  Inner Join TMPedidos AS P ON M.IDPedido = P.ID
  Inner Join TMClientes AS C ON P.IDCliente = C.ID
  FOR XML PATH ('mostachon')


USE LeoTurf
GO
SELECT J.ID AS "@EmpID", J.Nombre, J.Apellidos, J.Direccion, J.Telefono, J.Ciudad
	  ,A.MinID AS "apuesta/@apuID", C.ID AS "apuesta/caballo/@id", C.Nombre AS "apuesta/caballo", Ap.IDCarrera AS "apuesta/carrera/@id", Car.Fecha AS "apuesta/carrera/@fecha", Car.Hipodromo AS "apuesta/carrera/hipodromo", Ap.Importe AS "apuesta/importe"
	FROM LTJugadores AS J
		INNER JOIN (SELECT IDJugador, MIN(ID) AS MinID FROM LTApuestas GROUP BY IDJugador) AS A
			ON J.ID = A.IDJugador
		INNER JOIN LTApuestas AS Ap
			ON A.MinID = Ap.ID
		INNER JOIN LTCaballos AS C
			ON Ap.IDCaballo = C.ID
		INNER JOIN LTCarreras AS Car
			ON Ap.IDCarrera = Car.ID
	FOR XML PATH ('Jugador')

SELECT * FROM LTApuestas WHERE IDJugador = 1