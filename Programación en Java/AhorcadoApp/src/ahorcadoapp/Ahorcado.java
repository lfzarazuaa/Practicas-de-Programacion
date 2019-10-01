/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ahorcadoapp;

import static java.lang.Math.random;

/**
 *
 * @author ivazq
 */
public class Ahorcado {
    protected StringBuffer GuessWord;
    protected String HiddenWord;
    protected String Words[]; 
    private int NumWords=0;
    private int Attempts=0;
    private boolean FlagInit=false;
    
    public Ahorcado(int NumWords, int I)
    {
        Words=new String [NumWords];
        Attempts=I;
    }
    
    public void AddWord(String S)
    {
        if (NumWords<Words.length)       
        {
            Words[NumWords]=S;
            NumWords++;
        }
        
    }
    protected void setHiddenWord(int Index)
    {
        HiddenWord=Words[Index];
    }
    
    protected void SelectRandomWord()
    {
        int i;
            setHiddenWord((int)random()*NumWords);
            GuessWord=new StringBuffer();
            GuessWord.setLength(HiddenWord.length());
            for(i=0;i<HiddenWord.length();i++)
                GuessWord.setCharAt(i,'*');    
    }
    
    void Init() throws ExceptionHang
    {
        
        if (NumWords==0)
        {
            throw new ExceptionHang("No Words Add to Hang");
        }
        else
        {
            SelectRandomWord();
            FlagInit=true;
        }
    }
    
    int isChar(char i) throws ExceptionHang
    {
        int index=0;
        int Ocurrencia=0;
        if (FlagInit==false)
        {
            throw new ExceptionHang("No Hang Initizalited");
        }
        else
        {
           
            do
            {
                index=(HiddenWord.indexOf(i,index));
                if (index!=-1)
                {
                    GuessWord.setCharAt(index,i);
                    Ocurrencia++;
                }
                index++;
                
            }while(index!=0);
            if (Ocurrencia==0)
                Attempts--;            
        }
        
        return Ocurrencia;
    }
    
    int getAttempts()
    {
        return Attempts;
    }
    
    boolean isGuess() throws ExceptionHang
    {
        if (FlagInit==false)
        {
            throw new ExceptionHang("No Hang Initizalited");
        }
        else
        {    
            return HiddenWord.equals(GuessWord.toString());
        }
    }
    
    String getGuessWord() throws ExceptionHang
    {
        if (FlagInit==false)
        {
            throw new ExceptionHang("No Hang Initizalited");
        }
        else
        {
            return GuessWord.toString();
        }       
    }
        
}
