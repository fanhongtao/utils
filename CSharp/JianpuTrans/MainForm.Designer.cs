/*
 * Created by SharpDevelop.
 * User: fanho
 * Date: 2019/4/3
 * Time: 15:02
 * 
 * To change this template use Tools | Options | Coding | Edit Standard Headers.
 */
namespace JianpuTrans
{
	partial class MainForm
	{
		/// <summary>
		/// Designer variable used to keep track of non-visual components.
		/// </summary>
		private System.ComponentModel.IContainer components = null;
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.ComboBox keyComboBox;
		private System.Windows.Forms.Panel panel1;
		private System.Windows.Forms.SplitContainer splitContainer1;
		private System.Windows.Forms.RichTextBox inputText;
		private System.Windows.Forms.RichTextBox outputText;
		private System.Windows.Forms.GroupBox logGroupBox;
		private System.Windows.Forms.RichTextBox logTextBox;
		private System.Windows.Forms.Panel logPanel;
		private System.Windows.Forms.Button cleanLogButton;
		
		/// <summary>
		/// Disposes resources used by the form.
		/// </summary>
		/// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
		protected override void Dispose(bool disposing)
		{
			if (disposing) {
				if (components != null) {
					components.Dispose();
				}
			}
			base.Dispose(disposing);
		}
		
		/// <summary>
		/// This method is required for Windows Forms designer support.
		/// Do not change the method contents inside the source code editor. The Forms designer might
		/// not be able to load this method if it was changed manually.
		/// </summary>
		private void InitializeComponent()
		{
			this.label1 = new System.Windows.Forms.Label();
			this.keyComboBox = new System.Windows.Forms.ComboBox();
			this.panel1 = new System.Windows.Forms.Panel();
			this.splitContainer1 = new System.Windows.Forms.SplitContainer();
			this.inputText = new System.Windows.Forms.RichTextBox();
			this.outputText = new System.Windows.Forms.RichTextBox();
			this.logGroupBox = new System.Windows.Forms.GroupBox();
			this.logTextBox = new System.Windows.Forms.RichTextBox();
			this.logPanel = new System.Windows.Forms.Panel();
			this.cleanLogButton = new System.Windows.Forms.Button();
			this.panel1.SuspendLayout();
			((System.ComponentModel.ISupportInitialize)(this.splitContainer1)).BeginInit();
			this.splitContainer1.Panel1.SuspendLayout();
			this.splitContainer1.Panel2.SuspendLayout();
			this.splitContainer1.SuspendLayout();
			this.logGroupBox.SuspendLayout();
			this.logPanel.SuspendLayout();
			this.SuspendLayout();
			// 
			// label1
			// 
			this.label1.Location = new System.Drawing.Point(12, 5);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(73, 23);
			this.label1.TabIndex = 0;
			this.label1.Text = "目标调号";
			// 
			// keyComboBox
			// 
			this.keyComboBox.FormattingEnabled = true;
			this.keyComboBox.Location = new System.Drawing.Point(70, 5);
			this.keyComboBox.Name = "keyComboBox";
			this.keyComboBox.Size = new System.Drawing.Size(121, 20);
			this.keyComboBox.TabIndex = 1;
			this.keyComboBox.SelectedIndexChanged += new System.EventHandler(this.KeyComboBoxSelectedIndexChanged);
			// 
			// panel1
			// 
			this.panel1.Controls.Add(this.keyComboBox);
			this.panel1.Controls.Add(this.label1);
			this.panel1.Dock = System.Windows.Forms.DockStyle.Top;
			this.panel1.Location = new System.Drawing.Point(0, 0);
			this.panel1.Name = "panel1";
			this.panel1.Size = new System.Drawing.Size(372, 28);
			this.panel1.TabIndex = 2;
			// 
			// splitContainer1
			// 
			this.splitContainer1.Dock = System.Windows.Forms.DockStyle.Fill;
			this.splitContainer1.Location = new System.Drawing.Point(0, 28);
			this.splitContainer1.Name = "splitContainer1";
			// 
			// splitContainer1.Panel1
			// 
			this.splitContainer1.Panel1.Controls.Add(this.inputText);
			// 
			// splitContainer1.Panel2
			// 
			this.splitContainer1.Panel2.Controls.Add(this.outputText);
			this.splitContainer1.Size = new System.Drawing.Size(372, 290);
			this.splitContainer1.SplitterDistance = 179;
			this.splitContainer1.TabIndex = 3;
			// 
			// inputText
			// 
			this.inputText.Dock = System.Windows.Forms.DockStyle.Fill;
			this.inputText.Location = new System.Drawing.Point(0, 0);
			this.inputText.Name = "inputText";
			this.inputText.Size = new System.Drawing.Size(179, 290);
			this.inputText.TabIndex = 0;
			this.inputText.Text = "";
			this.inputText.TextChanged += new System.EventHandler(this.InputTextTextChanged);
			// 
			// outputText
			// 
			this.outputText.Dock = System.Windows.Forms.DockStyle.Fill;
			this.outputText.Location = new System.Drawing.Point(0, 0);
			this.outputText.Name = "outputText";
			this.outputText.ReadOnly = true;
			this.outputText.Size = new System.Drawing.Size(189, 290);
			this.outputText.TabIndex = 0;
			this.outputText.Text = "";
			// 
			// logGroupBox
			// 
			this.logGroupBox.Controls.Add(this.logTextBox);
			this.logGroupBox.Controls.Add(this.logPanel);
			this.logGroupBox.Dock = System.Windows.Forms.DockStyle.Bottom;
			this.logGroupBox.Location = new System.Drawing.Point(0, 158);
			this.logGroupBox.Name = "logGroupBox";
			this.logGroupBox.Size = new System.Drawing.Size(372, 160);
			this.logGroupBox.TabIndex = 4;
			this.logGroupBox.TabStop = false;
			this.logGroupBox.Text = "Log";
			// 
			// logTextBox
			// 
			this.logTextBox.Dock = System.Windows.Forms.DockStyle.Fill;
			this.logTextBox.Location = new System.Drawing.Point(3, 42);
			this.logTextBox.Name = "logTextBox";
			this.logTextBox.ReadOnly = true;
			this.logTextBox.Size = new System.Drawing.Size(366, 115);
			this.logTextBox.TabIndex = 0;
			this.logTextBox.Text = "";
			// 
			// logPanel
			// 
			this.logPanel.Controls.Add(this.cleanLogButton);
			this.logPanel.Dock = System.Windows.Forms.DockStyle.Top;
			this.logPanel.Location = new System.Drawing.Point(3, 17);
			this.logPanel.Name = "logPanel";
			this.logPanel.Size = new System.Drawing.Size(366, 25);
			this.logPanel.TabIndex = 1;
			// 
			// cleanLogButton
			// 
			this.cleanLogButton.Location = new System.Drawing.Point(1, 3);
			this.cleanLogButton.Name = "cleanLogButton";
			this.cleanLogButton.Size = new System.Drawing.Size(75, 23);
			this.cleanLogButton.TabIndex = 0;
			this.cleanLogButton.Text = "清除日志";
			this.cleanLogButton.UseVisualStyleBackColor = true;
			this.cleanLogButton.Click += new System.EventHandler(this.CleanLogButtonClick);
			// 
			// MainForm
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.ClientSize = new System.Drawing.Size(372, 318);
			this.Controls.Add(this.logGroupBox);
			this.Controls.Add(this.splitContainer1);
			this.Controls.Add(this.panel1);
			this.Name = "MainForm";
			this.Text = "简谱调号转换器";
			this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
			this.panel1.ResumeLayout(false);
			this.splitContainer1.Panel1.ResumeLayout(false);
			this.splitContainer1.Panel2.ResumeLayout(false);
			((System.ComponentModel.ISupportInitialize)(this.splitContainer1)).EndInit();
			this.splitContainer1.ResumeLayout(false);
			this.logGroupBox.ResumeLayout(false);
			this.logPanel.ResumeLayout(false);
			this.ResumeLayout(false);

		}
	}
}
