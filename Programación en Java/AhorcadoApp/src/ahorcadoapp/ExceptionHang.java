/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ahorcadoapp;

/**
 *
 * @author ivazq
 */
public class ExceptionHang extends Exception{
    ExceptionHang()
    {
        super();
    }
    
    ExceptionHang(String message)
    {
        super(message);
    }
    
    ExceptionHang(String message, Throwable cause)
    {
        super(message,cause);
    }
    
    ExceptionHang(Throwable cause)
    {
        super(cause);
    }
}
