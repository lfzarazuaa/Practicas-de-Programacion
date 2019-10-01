/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyecto_app;

import java.awt.Dimension;
import javax.swing.*;
import javax.swing.JOptionPane;
import static proyecto_app.Proyecto_APP.Panel_Opcion;
import static proyecto_app.Proyecto_APP.Principal;

/**
 *
 * @author LuisFernando
 */
public class Ventana_Ley_de_Ohm extends javax.swing.JFrame {
    //private double Voltaje,Corriente,Resistencia,Valor;
    //private double VoltajeAbs,CorrienteAbs,ResistenciaAbs;
    //private int NPrefijo_Voltaje,NPrefijo_Corriente,NPrefijo_Resistencia;
    private Numero_Compuesto Voltaje,Corriente,Resistencia;
    
    /**
     * Creates new form Ventana_Ley_de_Ohm
     */
    public Ventana_Ley_de_Ohm() {
        initComponents();
        Voltaje=new Numero_Compuesto(20,4);
        Corriente=new Numero_Compuesto(5,4);
        Resistencia=new Numero_Compuesto(4,4);
    }
    public void Leer_Corriente(){
        Panel_Opcion.removeAllItems_comboPrefijo();
        Panel_Opcion.addItem_comboPrefijo("pA");
        Panel_Opcion.addItem_comboPrefijo("nA");
        Panel_Opcion.addItem_comboPrefijo("uA");
        Panel_Opcion.addItem_comboPrefijo("mA");
        Panel_Opcion.addItem_comboPrefijo("A");
        Panel_Opcion.addItem_comboPrefijo("kA");
        Panel_Opcion.addItem_comboPrefijo("MA");
        Panel_Opcion.addItem_comboPrefijo("GA");
        Panel_Opcion.setText_txtCantidad(String.valueOf(Corriente.relativo));
        Panel_Opcion.setSelectedItem_comboPrefijo(Corriente.nprefijo);
        UIManager.put("OptionPane.minimumSize",new Dimension(250,150));
        int seleccion = JOptionPane.showOptionDialog( null,"Ingrese la corriente",
        "Ingreso de Parámetros",JOptionPane.YES_NO_CANCEL_OPTION,
        JOptionPane.QUESTION_MESSAGE,null,// null para icono por defecto.
        new Object[] {Panel_Opcion,"Aceptar"},"Aceptar");
        //System.out.println("seleccionada opcion " + (seleccion + 1));
        if (seleccion==1){
            if (Panel_Opcion.getNumber_txtCantidad()>0){
             //System.out.println("Corriente= "+Panel_Opcion.getNumber_txtCantidad());
             //System.out.println("Corriente= "+Panel_Opcion.getText_txtCantidad());
             //System.out.println("Prefijo= "+Panel_Opcion.getSelectedIndex_comboPrefijo());
             //Corriente.relativo=Panel_Opcion.getNumber_txtCantidad();
             //Corriente.nprefijo=Panel_Opcion.getSelectedIndex_comboPrefijo();
             //Corriente.Actualizar_Numero();
             Corriente.Actualizar_Numero(Panel_Opcion.getNumber_txtCantidad(),Panel_Opcion.getSelectedIndex_comboPrefijo());
             lblCorriente.setText(Corriente.getRelativo()+Corriente.getSprefijo()+"A");
             int opcion = JOptionPane.showOptionDialog( null,"¿Qué desea calcular?",
             "Ingreso de Parámetros",JOptionPane.YES_NO_CANCEL_OPTION,
             JOptionPane.QUESTION_MESSAGE,null,// null para icono por defecto.
             new Object[] {"R=V/I","V=IR"},"R=V/I");
             if (opcion==0){
               Actualizar_Resistencia(Voltaje.absoluto/Corriente.absoluto);
              }
             else if(opcion==1){
               Actualizar_Voltaje(Voltaje.absoluto*Resistencia.absoluto);
              }
             }
        }
    }
    public void Leer_Voltaje(){
        Panel_Opcion.removeAllItems_comboPrefijo();
        Panel_Opcion.addItem_comboPrefijo("pV");
        Panel_Opcion.addItem_comboPrefijo("nV");
        Panel_Opcion.addItem_comboPrefijo("uV");
        Panel_Opcion.addItem_comboPrefijo("mV");
        Panel_Opcion.addItem_comboPrefijo("V");
        Panel_Opcion.addItem_comboPrefijo("kV");
        Panel_Opcion.addItem_comboPrefijo("MV");
        Panel_Opcion.addItem_comboPrefijo("GV");
        Panel_Opcion.setText_txtCantidad(String.valueOf(Voltaje.relativo));
        Panel_Opcion.setSelectedItem_comboPrefijo(Voltaje.nprefijo);
        UIManager.put("OptionPane.minimumSize",new Dimension(250,150));
        int seleccion = JOptionPane.showOptionDialog( null,"Ingrese el voltaje",
        "Ingreso de Parámetros",JOptionPane.YES_NO_CANCEL_OPTION,
        JOptionPane.QUESTION_MESSAGE,null,// null para icono por defecto.
        new Object[] {Panel_Opcion,"Aceptar"},"Aceptar");
        //System.out.println("seleccionada opcion " + (seleccion + 1));
        if (seleccion==1){
            if (Panel_Opcion.getNumber_txtCantidad()>0){
             //System.out.println("Corriente= "+Panel_Opcion.getNumber_txtCantidad());
             //System.out.println("Corriente= "+Panel_Opcion.getText_txtCantidad());
             //System.out.println("Prefijo= "+Panel_Opcion.getSelectedIndex_comboPrefijo());
             //Corriente.relativo=Panel_Opcion.getNumber_txtCantidad();
             //Corriente.nprefijo=Panel_Opcion.getSelectedIndex_comboPrefijo();
             //Corriente.Actualizar_Numero();
             Voltaje.Actualizar_Numero(Panel_Opcion.getNumber_txtCantidad(),Panel_Opcion.getSelectedIndex_comboPrefijo());
             lblVoltaje.setText(Voltaje.getRelativo()+Voltaje.getSprefijo()+"V");
             int opcion = JOptionPane.showOptionDialog( null,"¿Qué desea calcular?",
             "Ingreso de Parámetros",JOptionPane.YES_NO_CANCEL_OPTION,
             JOptionPane.QUESTION_MESSAGE,null,// null para icono por defecto.
             new Object[] {"I=V/R","R=V/I"},"I=V/R");
             if (opcion==0){
               Actualizar_Corriente(Voltaje.absoluto/Resistencia.absoluto);
              }
             else if(opcion==1){
               Actualizar_Resistencia(Voltaje.absoluto*Corriente.absoluto);
              }
             }
        }
    }
    public void Leer_Resistencia(){
        Panel_Opcion.removeAllItems_comboPrefijo();
        Panel_Opcion.addItem_comboPrefijo("pΩ");
        Panel_Opcion.addItem_comboPrefijo("nΩ");
        Panel_Opcion.addItem_comboPrefijo("uΩ");
        Panel_Opcion.addItem_comboPrefijo("mΩ");
        Panel_Opcion.addItem_comboPrefijo("Ω");
        Panel_Opcion.addItem_comboPrefijo("kΩ");
        Panel_Opcion.addItem_comboPrefijo("MΩ");
        Panel_Opcion.addItem_comboPrefijo("GΩ");
        Panel_Opcion.setText_txtCantidad(String.valueOf(Resistencia.relativo));
        Panel_Opcion.setSelectedItem_comboPrefijo(Resistencia.nprefijo);
        UIManager.put("OptionPane.minimumSize",new Dimension(250,150));
        int seleccion = JOptionPane.showOptionDialog( null,"Ingrese la resistencia",
        "Ingreso de Parámetros",JOptionPane.YES_NO_CANCEL_OPTION,
        JOptionPane.QUESTION_MESSAGE,null,// null para icono por defecto.
        new Object[] {Panel_Opcion,"Aceptar"},"Aceptar");
        //System.out.println("seleccionada opcion " + (seleccion + 1));
        if (seleccion==1){
            if (Panel_Opcion.getNumber_txtCantidad()>0){
             Resistencia.Actualizar_Numero(Panel_Opcion.getNumber_txtCantidad(),Panel_Opcion.getSelectedIndex_comboPrefijo());
             lblResistencia.setText(Resistencia.getRelativo()+Resistencia.getSprefijo()+"Ω");
             int opcion = JOptionPane.showOptionDialog( null,"¿Qué desea calcular?",
             "Ingreso de Parámetros",JOptionPane.YES_NO_CANCEL_OPTION,
             JOptionPane.QUESTION_MESSAGE,null,// null para icono por defecto.
             new Object[] {"V=IR","I=V/R"},"I=V/R");
             if (opcion==0){
               Actualizar_Voltaje(Resistencia.absoluto*Resistencia.absoluto);
              }
             else if(opcion==1){
               Actualizar_Corriente(Resistencia.absoluto/Resistencia.absoluto);
              }
             }
        }
    }
    public String Redondear4(double Numero){
     String  A;
     A=String.format("%.4f %%",Numero);
     return A.replace("%","");
    }
    public void Actualizar_Resistencia(double Numero){
     Resistencia.Actualizar_Absoluto(Numero);
     lblResistencia.setText(Redondear4(Resistencia.getRelativo())+Resistencia.getSprefijo()+"Ω");
    }
    public void Actualizar_Corriente(double Numero){
     Corriente.Actualizar_Absoluto(Numero);
     lblCorriente.setText(Redondear4(Corriente.getRelativo())+Corriente.getSprefijo()+"A");
    }
    public void Actualizar_Voltaje(double Numero){
     Voltaje.Actualizar_Absoluto(Numero);
     lblVoltaje.setText(Redondear4(Voltaje.getRelativo())+Voltaje.getSprefijo()+"V");
    }
    public String Asignar_Prefijo(int Prefijo){
     switch (Prefijo){
         case 0:
         return "p";
         case 1:
         return "n";
         case 2:
         return "u";
         case 3:
         return "m";
         case 4:
         return " ";
         case 5:
         return "k";
         case 6:
         return "M";
         case 7:
         return "G";
         default:
         return " ";
     }
    }
    public int Encontrar_Prefijo(double Cantidad){
     if (Cantidad<Math.pow(10,-9)){
      return 0;}
     else if(Cantidad<Math.pow(10,-6)){
      return 1;}    
     else if(Cantidad<Math.pow(10,-3)){
      return 2;}
     else if(Cantidad<Math.pow(10,0)){
      return 3;}
     else if(Cantidad<Math.pow(10,3)){
      return 4;}
     else if(Cantidad<Math.pow(10,6)){
      return 5;}
     else if(Cantidad<Math.pow(10,9)){
      return 6;}
     else{
      return 7;}
    }
    public double Asignar_Valor(double Cantidad,int Prefijo){
        switch (Prefijo){
         case 0:
         return Cantidad*Math.pow(10,-12);
         case 1:
         return Cantidad*Math.pow(10,-9);
         case 2:
         return Cantidad*Math.pow(10,-6);
         case 3:
         return Cantidad*Math.pow(10,-3);
         case 4:
         return Cantidad;
         case 5:
         return Cantidad*1000;
         case 6:
         return Cantidad*Math.pow(10,6);
         case 7:
         return Cantidad*Math.pow(10,9);
         default:
         return Cantidad;
     }        
    }
    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        lblRegresar = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        lblCorriente = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        lblResistencia = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();
        lblVoltaje = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setBackground(new java.awt.Color(255, 204, 51));
        getContentPane().setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jPanel1.setBackground(new java.awt.Color(51, 204, 0));
        jPanel1.setFont(new java.awt.Font("Tahoma", 0, 18)); // NOI18N

        jLabel1.setFont(new java.awt.Font("Tahoma", 1, 24)); // NOI18N
        jLabel1.setText("Ley de Ohm");

        lblRegresar.setFont(new java.awt.Font("Tahoma", 0, 18)); // NOI18N
        lblRegresar.setText("Regresar");
        lblRegresar.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                lblRegresarMouseClicked(evt);
            }
        });

        jLabel2.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Imagenes/Ley_de_Ohm.png"))); // NOI18N
        jLabel2.setText("jLabel2");

        jLabel3.setFont(new java.awt.Font("Tahoma", 0, 18)); // NOI18N
        jLabel3.setText("I");

        lblCorriente.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        lblCorriente.setText("5 A");
        lblCorriente.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                lblCorrienteMouseClicked(evt);
            }
        });

        jLabel5.setFont(new java.awt.Font("Tahoma", 0, 18)); // NOI18N
        jLabel5.setText("R");

        lblResistencia.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        lblResistencia.setText("4 Ω");
        lblResistencia.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                lblResistenciaMouseClicked(evt);
            }
        });

        jLabel7.setFont(new java.awt.Font("Tahoma", 0, 18)); // NOI18N
        jLabel7.setText("V");

        lblVoltaje.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        lblVoltaje.setText("20 V");
        lblVoltaje.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                lblVoltajeMouseClicked(evt);
            }
        });

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                .addGap(0, 0, Short.MAX_VALUE)
                .addComponent(jLabel1)
                .addGap(187, 187, 187))
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(256, 256, 256)
                        .addComponent(jLabel3))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(53, 53, 53)
                        .addComponent(lblRegresar))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addGap(55, 55, 55)
                                .addComponent(jLabel7))
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addContainerGap()
                                .addComponent(lblVoltaje, javax.swing.GroupLayout.PREFERRED_SIZE, 123, javax.swing.GroupLayout.PREFERRED_SIZE)))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 270, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addGap(30, 30, 30)
                                .addComponent(jLabel5))
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addGap(3, 3, 3)
                                .addComponent(lblResistencia, javax.swing.GroupLayout.PREFERRED_SIZE, 92, javax.swing.GroupLayout.PREFERRED_SIZE))))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(206, 206, 206)
                        .addComponent(lblCorriente, javax.swing.GroupLayout.PREFERRED_SIZE, 141, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(22, Short.MAX_VALUE))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addComponent(jLabel1)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jLabel3)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addGap(52, 52, 52)
                                .addComponent(jLabel5)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addComponent(lblResistencia))
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addGap(6, 6, 6)
                                .addComponent(lblCorriente)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 185, javax.swing.GroupLayout.PREFERRED_SIZE)))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 66, Short.MAX_VALUE)
                        .addComponent(lblRegresar)
                        .addGap(23, 23, 23))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(49, 49, 49)
                        .addComponent(jLabel7)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(lblVoltaje)
                        .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))))
        );

        getContentPane().add(jPanel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 10, -1, -1));

        pack();
    }// </editor-fold>//GEN-END:initComponents
    private Object makeObj(final String item)  {
     return new Object() {@Override public String toString() { return item; } };
   }
    private void lblRegresarMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_lblRegresarMouseClicked
        // TODO add your handling code here:
        this.setVisible(false);
        Principal.setVisible(true);
    }//GEN-LAST:event_lblRegresarMouseClicked

    private void lblResistenciaMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_lblResistenciaMouseClicked
        // TODO add your handling code here:
        Leer_Resistencia();
    }//GEN-LAST:event_lblResistenciaMouseClicked

    private void lblCorrienteMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_lblCorrienteMouseClicked
        // TODO add your handling code here:
        Leer_Corriente();
    }//GEN-LAST:event_lblCorrienteMouseClicked

    private void lblVoltajeMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_lblVoltajeMouseClicked
        // TODO add your handling code here:
        Leer_Voltaje();
    }//GEN-LAST:event_lblVoltajeMouseClicked

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(Ventana_Ley_de_Ohm.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Ventana_Ley_de_Ohm.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Ventana_Ley_de_Ohm.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Ventana_Ley_de_Ohm.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Ventana_Ley_de_Ohm().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JLabel lblCorriente;
    private javax.swing.JLabel lblRegresar;
    private javax.swing.JLabel lblResistencia;
    private javax.swing.JLabel lblVoltaje;
    // End of variables declaration//GEN-END:variables
}
