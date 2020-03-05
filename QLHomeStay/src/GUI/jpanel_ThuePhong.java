/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package GUI;

import BLL.HoaDonBLL;
import BLL.KhachHangBLL;
import BLL.LoaiPhongBLL;
import BLL.NhanVienBLL;
import BLL.PhieuDichVuBLL;
import BLL.PhieuThuePhongBLL;
import BLL.PhongBLL;
import DTO.KhachHang;
import DTO.PhieuThuePhong;
import Binding.ControlFormat;
import java.awt.Color;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import static javafx.scene.paint.Color.color;
import javax.swing.ButtonGroup;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.SwingUtilities;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author RumIT
 */
public class jpanel_ThuePhong extends javax.swing.JPanel {

    /**
     * Creates new form jpanel_ThuePhong
     */
    public jpanel_ThuePhong(){
        
    }
    
    private String tenNV;
    public jpanel_ThuePhong(String tenNhanVien) {
        initComponents(); 
        tenNV = tenNhanVien;
        showPanel(new jpanel_Thue_1(tenNV));
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jDialog1 = new javax.swing.JDialog();
        panel_bg = new javax.swing.JPanel();
        panel_Content = new javax.swing.JPanel();
        btn_Tang = new javax.swing.JPanel();
        btn_Tang1 = new javax.swing.JButton();
        btn_Tang2 = new javax.swing.JButton();

        javax.swing.GroupLayout jDialog1Layout = new javax.swing.GroupLayout(jDialog1.getContentPane());
        jDialog1.getContentPane().setLayout(jDialog1Layout);
        jDialog1Layout.setHorizontalGroup(
            jDialog1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 578, Short.MAX_VALUE)
        );
        jDialog1Layout.setVerticalGroup(
            jDialog1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 401, Short.MAX_VALUE)
        );

        setMaximumSize(new java.awt.Dimension(1054, 491));
        setMinimumSize(new java.awt.Dimension(1054, 491));
        addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                formMouseClicked(evt);
            }
        });

        panel_bg.setBackground(new java.awt.Color(255, 255, 255));
        panel_bg.setMaximumSize(new java.awt.Dimension(1054, 491));
        panel_bg.setMinimumSize(new java.awt.Dimension(1054, 491));

        panel_Content.setMaximumSize(new java.awt.Dimension(914, 491));
        panel_Content.setMinimumSize(new java.awt.Dimension(914, 491));
        panel_Content.setLayout(new java.awt.BorderLayout());

        btn_Tang.setBackground(new java.awt.Color(255, 255, 255));

        btn_Tang1.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        btn_Tang1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/libs/image/number-1-icon.png"))); // NOI18N
        btn_Tang1.setFocusable(false);
        btn_Tang1.setHorizontalTextPosition(javax.swing.SwingConstants.CENTER);
        btn_Tang1.setVerticalTextPosition(javax.swing.SwingConstants.BOTTOM);
        btn_Tang1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btn_Tang1ActionPerformed(evt);
            }
        });

        btn_Tang2.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        btn_Tang2.setIcon(new javax.swing.ImageIcon(getClass().getResource("/libs/image/number-2-icon.png"))); // NOI18N
        btn_Tang2.setFocusable(false);
        btn_Tang2.setHorizontalTextPosition(javax.swing.SwingConstants.CENTER);
        btn_Tang2.setVerticalTextPosition(javax.swing.SwingConstants.BOTTOM);
        btn_Tang2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btn_Tang2ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout btn_TangLayout = new javax.swing.GroupLayout(btn_Tang);
        btn_Tang.setLayout(btn_TangLayout);
        btn_TangLayout.setHorizontalGroup(
            btn_TangLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(btn_Tang2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
            .addComponent(btn_Tang1, javax.swing.GroupLayout.DEFAULT_SIZE, 126, Short.MAX_VALUE)
        );
        btn_TangLayout.setVerticalGroup(
            btn_TangLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(btn_TangLayout.createSequentialGroup()
                .addContainerGap(22, Short.MAX_VALUE)
                .addComponent(btn_Tang1, javax.swing.GroupLayout.PREFERRED_SIZE, 213, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(btn_Tang2, javax.swing.GroupLayout.PREFERRED_SIZE, 213, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(25, 25, 25))
        );

        javax.swing.GroupLayout panel_bgLayout = new javax.swing.GroupLayout(panel_bg);
        panel_bg.setLayout(panel_bgLayout);
        panel_bgLayout.setHorizontalGroup(
            panel_bgLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, panel_bgLayout.createSequentialGroup()
                .addComponent(btn_Tang, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(panel_Content, javax.swing.GroupLayout.DEFAULT_SIZE, 922, Short.MAX_VALUE))
        );
        panel_bgLayout.setVerticalGroup(
            panel_bgLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(panel_Content, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
            .addComponent(btn_Tang, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(panel_bg, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(panel_bg, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
    }// </editor-fold>//GEN-END:initComponents

    //Hàm show jpanel
    public void showPanel(JPanel p){
        panel_Content.removeAll();
        panel_Content.setVisible(true);
        panel_Content.add(p);
        panel_Content.validate();
        
    }
    
    private void formMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_formMouseClicked
        
    }//GEN-LAST:event_formMouseClicked

    private void btn_Tang1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btn_Tang1ActionPerformed
        showPanel(new jpanel_Thue_1(tenNV));
    }//GEN-LAST:event_btn_Tang1ActionPerformed

    private void btn_Tang2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btn_Tang2ActionPerformed
        showPanel(new jpanel_Thue_2(tenNV));
    }//GEN-LAST:event_btn_Tang2ActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JPanel btn_Tang;
    private javax.swing.JButton btn_Tang1;
    private javax.swing.JButton btn_Tang2;
    private javax.swing.JDialog jDialog1;
    private javax.swing.JPanel panel_Content;
    private javax.swing.JPanel panel_bg;
    // End of variables declaration//GEN-END:variables
}