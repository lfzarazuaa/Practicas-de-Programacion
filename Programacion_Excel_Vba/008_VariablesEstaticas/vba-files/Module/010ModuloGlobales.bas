Private Sub cmdMarcarFestivos_Click()
    Dim CeldasSeleccionadas As Range'Tipo Range puede declarar a varias celdas o a una celda.
    Dim Celda As Range'Los de tipo Range no se inicializan con un valor.
    Dim Dia As Byte' Byte para obtener el día de la semana.

    On Error GoTo ControlErrores'Si se encuentra un error salta a la etiqueta definida (Control Errores).
        Set CeldasSeleccionadas = Application.InputBox("Seleccione las celdas con las flechas.", "Marcar Festivos.", , , , , , 8)'El tipo de dato que permite es celda.
        For Each Celda In CeldasSeleccionadas 'Uso de For Each para recorrer cada elemento de las celdas.
            If IsDate(Celda) = True Then' Se verifica que sea un dato de fecha para realizar la comprobación.
                Dia = Weekday(Celda)'Se obtiene el día de la semana correspondiente.
                If Dia = 7 Or Dia = 1 Then 'Verifica que sea sábado o domingo.
                    Celda.Interior.Color =vbRed 'Marca de color rojo la celda que sea sábado o domingo.
                End If
            End If
        Next 
    Exit Sub
    ControlErrores:
        If (Err.Number = 424) Then 'Error por cancelar el inputbox.
            MsgBox "Se ha cancelado el marcado de festivos.", vbInformation ,"Cancelado." 
        ElseIf (Err.Number = 13) Then 'Error por tipo de dato.
            MsgBox "Se ha producido un problema. Revisa que entre las celdas seleccionadas no exista una fecha inválida", vbInformation, "Fecha Inválida." 
        Else
            MsgBox "Se ha producido un error." & vbCrLf & "Código" & Err.Number & vbCrLf & "Descripción: " & Err.Description, vbCritical,"Error." 'Al producirse un error Exel nos guarda en Err sus distintas propiedades.
        End If
End Sub