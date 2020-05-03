Attribute VB_Name = "M�dulo1"
    
    Dim Fecha As Date 'Fecha como Dato tipo Fecha.
    Dim Planta As String * 10 'Planta como dato tipo String (de 10 caracteres).
    Dim ProductoA As Integer
    Dim ProductoB As Integer
    Dim ProductoC As Integer
    Dim Mensaje As String 'Mensaje como dato tipo String.
    Dim Boton As Integer 'Dato para los valores del boton.
    Static Fila As Long 'Dato tipo Long por el número de celdas posibles.
    
        Fecha = Application.InputBox("Introduce la fecha de la producción.", "Fecha.", Format(Date, "dd/mm/yyyy")) 'Primer argumento mensaje, titulo, texto por default.
        Planta = Application.InputBox("Introduce la planta de producción.", "Planta.") 'Obtener el dato de la planta.
        ProductoA = Application.InputBox("Introduce las unidades producidas del Producto A.", "Producto A.", , , , , , 1) 'Paso de parámetros por posición.
        ProductoB = Application.InputBox(Prompt:="Introduce las unidades producidas del Producto B.", Title:="Producto B.", Type:=1) 'Paso de parámetros por argumento Type=1 acepta enteros.
        ProductoC = Application.InputBox("Introduce las unidades producidas del Producto C.", "Producto C.", , , , , , 1) 'Obtener el dato del producto C.

        'Creación del mensaje por medio de concatenación.
        Mensaje = "¿Deseas guardar esta información?" & vbCrLf'Concatena usando el operador &.
        Mensaje = Mensaje  & "Fecha: " & Fecha & vbCrLf'Para agregar un salto de linea se usa vbCrLf.
        Mensaje = Mensaje  & "Planta: " & Planta & vbCrLf
        Mensaje = Mensaje  & "Unidades del producto A: " & ProductoA & vbCrLf
        Mensaje = Mensaje  & "Unidades del producto B: " & ProductoB & vbCrLf
        Mensaje = Mensaje  & "Unidades del producto C: " & ProductoC & vbCrLf
        Mensaje = Mensaje  & "Total: " & ProductoA + ProductoB + ProductoC

        Boton = MsgBox(Mensaje, vbInformation + vbYesNo, "Guardar.")'Despliega el botón con el mensaje de los datos obtenidos.

        If (Boton = vbYes) Then
            If (Fila = 0) Then 'Si es cero significa que el documento se acaba de abrir u ocurrió un error en tiempo de ejecución al ser estáticos.
                Fila = ActiveSheet.Cells(1048576, "A").End(xlUp).Row + 1'Obtiene la ultima con datos en la columna A, contando desde la celda 1048576.
            Else
                Fila = Fila + 1'Guarda el valor de la ultima fila a modificar.
            End If
            Cells(Fila, "A").Value = Fecha'Guarda en columna A el valor de fecha.
            Cells(Fila, "B").Value = Planta'Guarda en columna B la Planta.
            Cells(Fila, "C").Value = ProductoA'Guarda en columna C el valor del producto A.
            Cells(Fila, "D").Value = ProductoB'Guarda en columna D el valor del producto B. 
            Cells(Fila, "E").Value = ProductoC'Guarda en columna E el valor del producto C. 
            Cells(Fila, "F").Value = ProductoA + ProductoB + ProductoC'Guarda en columna F el valor total de la producción.
        End If

        