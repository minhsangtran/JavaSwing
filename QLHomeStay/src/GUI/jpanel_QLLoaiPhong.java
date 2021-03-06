/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package GUI;

import BLL.LoaiPhongBLL;
import BLL.PhongBLL;
import Binding.ControlFormat;
import java.util.ArrayList;
import javax.swing.JOptionPane;

/**
 *
 * @author HUY
 */
public class jpanel_QLLoaiPhong extends javax.swing.JPanel {

    //khởi tạo các đối tượng cần thiết
    
    LoaiPhongBLL loaiphongBLL = new LoaiPhongBLL();
    ControlFormat control = new ControlFormat();
    PhongBLL phongBLL = new PhongBLL(); 
    //
    //
    //
    
    /**
     * Creates new form 
     */
    public jpanel_QLLoaiPhong() {
        initComponents();
        
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jScrollPane1 = new javax.swing.JScrollPane();
        table_DSLoaiPhong = new javax.swing.JTable();
        jPanel1 = new javax.swing.JPanel();
        jPanel2 = new javax.swing.JPanel();
        lb_TenLoai = new javax.swing.JLabel();
        lb_GiaQuaDem = new javax.swing.JLabel();
        lb_GiaGioDau = new javax.swing.JLabel();
        txt_GiaQuaDem = new javax.swing.JTextField();
        txt_GiaGioDau = new javax.swing.JTextField();
        txt_TenLoaiP = new javax.swing.JTextField();
        lb_MaLoaiP = new javax.swing.JLabel();
        txt_MaLoaiP = new javax.swing.JTextField();
        panel_Buttons = new javax.swing.JPanel();
        btn_Sua = new javax.swing.JButton();
        btn_Them = new javax.swing.JButton();
        btn_Xoa = new javax.swing.JButton();
        btn_XacNhanThem = new javax.swing.JButton();

        setBackground(new java.awt.Color(255, 255, 255));
        setMaximumSize(new java.awt.Dimension(954, 438));
        setMinimumSize(new java.awt.Dimension(954, 438));
        setPreferredSize(new java.awt.Dimension(954, 438));

        table_DSLoaiPhong.setFont(new java.awt.Font("Tahoma", 0, 12)); // NOI18N
        table_DSLoaiPhong.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {},
                {},
                {},
                {}
            },
            new String [] {

            }
        ));
        table_DSLoaiPhong.setGridColor(new java.awt.Color(255, 255, 255));
        table_DSLoaiPhong.setRowHeight(20);
        table_DSLoaiPhong.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                table_DSLoaiPhongMouseClicked(evt);
            }
        });
        jScrollPane1.setViewportView(table_DSLoaiPhong);

        jPanel1.setBackground(new java.awt.Color(255, 255, 255));

        jPanel2.setBackground(new java.awt.Color(255, 255, 255));
        jPanel2.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Thông tin loại phòng", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 1, 12))); // NOI18N

        lb_TenLoai.setFont(new java.awt.Font("Tahoma", 0, 12)); // NOI18N
        lb_TenLoai.setText("LOẠI PHÒNG");

        lb_GiaQuaDem.setFont(new java.awt.Font("Tahoma", 0, 12)); // NOI18N
        lb_GiaQuaDem.setText("GIÁ QUA ĐÊM");

        lb_GiaGioDau.setFont(new java.awt.Font("Tahoma", 0, 12)); // NOI18N
        lb_GiaGioDau.setText("GIÁ GIỜ ĐẦU");

        txt_TenLoaiP.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txt_TenLoaiPActionPerformed(evt);
            }
        });

        lb_MaLoaiP.setFont(new java.awt.Font("Tahoma", 0, 12)); // NOI18N
        lb_MaLoaiP.setText("MÃ LOẠI PHÒNG");

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(lb_TenLoai)
                            .addComponent(lb_GiaQuaDem)
                            .addComponent(lb_GiaGioDau, javax.swing.GroupLayout.Alignment.TRAILING))
                        .addGap(25, 25, 25)
                        .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(txt_GiaGioDau, javax.swing.GroupLayout.DEFAULT_SIZE, 190, Short.MAX_VALUE)
                            .addComponent(txt_TenLoaiP)
                            .addComponent(txt_GiaQuaDem)))
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addComponent(lb_MaLoaiP)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(txt_MaLoaiP)))
                .addContainerGap())
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(lb_MaLoaiP)
                    .addComponent(txt_MaLoaiP, javax.swing.GroupLayout.PREFERRED_SIZE, 29, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txt_TenLoaiP, javax.swing.GroupLayout.PREFERRED_SIZE, 27, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(lb_TenLoai))
                .addGap(18, 18, 18)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txt_GiaQuaDem, javax.swing.GroupLayout.PREFERRED_SIZE, 29, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(lb_GiaQuaDem))
                .addGap(18, 18, 18)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txt_GiaGioDau, javax.swing.GroupLayout.PREFERRED_SIZE, 27, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(lb_GiaGioDau))
                .addGap(78, 78, 78))
        );

        panel_Buttons.setBackground(new java.awt.Color(255, 255, 255));

        btn_Sua.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        btn_Sua.setIcon(new javax.swing.ImageIcon(getClass().getResource("/libs/image/pencil_32.png"))); // NOI18N
        btn_Sua.setText("SỬA");
        btn_Sua.setMaximumSize(new java.awt.Dimension(133, 41));
        btn_Sua.setMinimumSize(new java.awt.Dimension(133, 41));
        btn_Sua.setPreferredSize(new java.awt.Dimension(133, 41));
        btn_Sua.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btn_SuaActionPerformed(evt);
            }
        });

        btn_Them.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        btn_Them.setIcon(new javax.swing.ImageIcon(getClass().getResource("/libs/image/plus.png"))); // NOI18N
        btn_Them.setText("THÊM");
        btn_Them.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btn_ThemActionPerformed(evt);
            }
        });

        btn_Xoa.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        btn_Xoa.setIcon(new javax.swing.ImageIcon(getClass().getResource("/libs/image/delete.png"))); // NOI18N
        btn_Xoa.setText("XÓA");
        btn_Xoa.setMaximumSize(new java.awt.Dimension(133, 41));
        btn_Xoa.setMinimumSize(new java.awt.Dimension(133, 41));
        btn_Xoa.setPreferredSize(new java.awt.Dimension(133, 41));
        btn_Xoa.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btn_XoaActionPerformed(evt);
            }
        });

        btn_XacNhanThem.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        btn_XacNhanThem.setIcon(new javax.swing.ImageIcon(getClass().getResource("/libs/image/iconfinder_floppy_285657 (1).png"))); // NOI18N
        btn_XacNhanThem.setText("LƯU");
        btn_XacNhanThem.setMaximumSize(new java.awt.Dimension(133, 41));
        btn_XacNhanThem.setMinimumSize(new java.awt.Dimension(133, 41));
        btn_XacNhanThem.setPreferredSize(new java.awt.Dimension(133, 41));
        btn_XacNhanThem.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btn_XacNhanThemActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout panel_ButtonsLayout = new javax.swing.GroupLayout(panel_Buttons);
        panel_Buttons.setLayout(panel_ButtonsLayout);
        panel_ButtonsLayout.setHorizontalGroup(
            panel_ButtonsLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(panel_ButtonsLayout.createSequentialGroup()
                .addContainerGap()
                .addGroup(panel_ButtonsLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(btn_Sua, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(btn_Them, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(panel_ButtonsLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(btn_XacNhanThem, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(btn_Xoa, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        panel_ButtonsLayout.setVerticalGroup(
            panel_ButtonsLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(panel_ButtonsLayout.createSequentialGroup()
                .addContainerGap()
                .addGroup(panel_ButtonsLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btn_Sua, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(btn_Xoa, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(panel_ButtonsLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btn_Them)
                    .addComponent(btn_XacNhanThem, javax.swing.GroupLayout.PREFERRED_SIZE, 41, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addComponent(jPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 0, Short.MAX_VALUE))
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(panel_Buttons, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addComponent(jPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, 214, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(panel_Buttons, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addGap(74, 74, 74))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 554, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(58, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 438, Short.MAX_VALUE)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
    }// </editor-fold>//GEN-END:initComponents
    
    private void table_DSLoaiPhongMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_table_DSLoaiPhongMouseClicked
        
    }//GEN-LAST:event_table_DSLoaiPhongMouseClicked

    private void btn_SuaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btn_SuaActionPerformed
       
    }//GEN-LAST:event_btn_SuaActionPerformed

    private void btn_XoaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btn_XoaActionPerformed
       
    }//GEN-LAST:event_btn_XoaActionPerformed

    private void btn_ThemActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btn_ThemActionPerformed
       
    }//GEN-LAST:event_btn_ThemActionPerformed

    private void btn_XacNhanThemActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btn_XacNhanThemActionPerformed
        
    }//GEN-LAST:event_btn_XacNhanThemActionPerformed

    private void txt_TenLoaiPActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txt_TenLoaiPActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txt_TenLoaiPActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btn_Sua;
    private javax.swing.JButton btn_Them;
    private javax.swing.JButton btn_XacNhanThem;
    private javax.swing.JButton btn_Xoa;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JLabel lb_GiaGioDau;
    private javax.swing.JLabel lb_GiaQuaDem;
    private javax.swing.JLabel lb_MaLoaiP;
    private javax.swing.JLabel lb_TenLoai;
    private javax.swing.JPanel panel_Buttons;
    private javax.swing.JTable table_DSLoaiPhong;
    private javax.swing.JTextField txt_GiaGioDau;
    private javax.swing.JTextField txt_GiaQuaDem;
    private javax.swing.JTextField txt_MaLoaiP;
    private javax.swing.JTextField txt_TenLoaiP;
    // End of variables declaration//GEN-END:variables
}
