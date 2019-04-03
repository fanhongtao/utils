/*
 * Created by SharpDevelop.
 * User: fanho
 * Date: 2019/4/3
 * Time: 15:02
 * 
 * To change this template use Tools | Options | Coding | Edit Standard Headers.
 */
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Text.RegularExpressions;
using System.Windows.Forms;

namespace JianpuTrans
{
	/// <summary>
	/// Description of MainForm.
	/// </summary>
	public partial class MainForm : Form
	{
		private Dictionary<string, string[]> keyMap;
		
		public MainForm()
		{
			//
			// The InitializeComponent() call is required for Windows Forms designer support.
			//
			InitializeComponent();
			//
			// TODO: Add constructor code after the InitializeComponent() call.
			//
			InitKeyComboBox();
			InitKeyMap();
			ShowHelpMessage();
			
			Logger.SetTextBox(logTextBox);
			Logger.info("Program start.");
		}
		
		private void InitKeyComboBox()
		{
			// 定义一个“调号”字典， key: 内部名称, value: 显示名称
			var dictonary = new Dictionary<string, string>();
			dictonary.Add("aes-major", "A b 大调");
			dictonary.Add("a-major", "A 大调");
			dictonary.Add("bes-major", "B b 大调");
			dictonary.Add("b-major", "B 大调");
			dictonary.Add("ces-major", "C b 大调");
			dictonary.Add("c-major", "C 大调");
			dictonary.Add("cis-major", "C # 大调");
			dictonary.Add("des-major", "D b 大调");
			dictonary.Add("d-major", "D 大调");
			dictonary.Add("ees-major", "E b 大调");
			dictonary.Add("e-major", "E 大调");
			dictonary.Add("f-major", "F 大调");
			dictonary.Add("fis-major", "F # 大调");
			dictonary.Add("ges-major", "G b 大调");
			dictonary.Add("g-major", "G 大调");
			
			// 与 ComboBox 绑定
			var bs = new BindingSource();
			bs.DataSource = dictonary;
			keyComboBox.DataSource = bs;
			keyComboBox.ValueMember = "Key";
			keyComboBox.DisplayMember = "Value";
		}
		
		private void InitKeyMap()
		{
			keyMap = new Dictionary<string, string[]>();
			
			// 大调，不升不降
			keyMap.Add("c-major", new string[] { "c", "d", "e", "f", "g", "a", "b" });
			
			// 大调，升，按升号个数排序
			keyMap.Add("g-major", new string[] { "g", "a", "b", "c", "d", "e", "fis" });
			keyMap.Add("d-major", new string[] { "d", "e", "fis", "g", "a", "b", "cis" });
			keyMap.Add("a-major", new string[] { "a", "b", "cis", "d", "e", "fis", "gis" });
			keyMap.Add("e-major", new string[] { "e", "fis", "gis", "a", "b", "cis", "dis" });
			keyMap.Add("b-major", new string[] { "b", "cis", "dis", "e", "fis", "gis", "ais" });
			keyMap.Add("fis-major", new string[] { "fis", "gis", "ais", "b", "cis", "dis", "eis" });
			keyMap.Add("cis-major", new string[] { "cis", "dis", "eis", "fis", "gis", "ais", "bis" });
			
			// 大调，降，按降号个数排序
			keyMap.Add("f-major", new string[] { "f", "g", "a", "bes", "c", "d", "e" });
			keyMap.Add("bes-major", new string[] { "bes", "c", "d", "ees", "f", "g", "a" });
			keyMap.Add("ees-major", new string[] { "ees", "f", "g", "aes", "bes", "c", "d" });
			keyMap.Add("aes-major", new string[] { "aes", "bes", "c", "des", "ees", "f", "g" });
			keyMap.Add("des-major", new string[] { "des", "ees", "f", "ges", "aes", "bes", "c" });
			keyMap.Add("ges-major", new string[] { "ges", "aes", "bes", "ces", "des", "ees", "f" });
			keyMap.Add("ces-major", new string[] { "ces", "des", "ees", "fes", "ges", "aes", "bes" });
		}
		
		void InputTextTextChanged(object sender, EventArgs e)
		{
			ConvertKeys();
		}

		void KeyComboBoxSelectedIndexChanged(object sender, EventArgs e)
		{
			ConvertKeys();
		}
		
		private void ConvertKeys()
		{
			outputText.Clear();
			var selectedItem = (KeyValuePair<string, string>)keyComboBox.SelectedItem;
			Logger.info("C 调 转换成 " + selectedItem.Value);
			
			string key = selectedItem.Key; // (string)keyComboBox.SelectedValue;
			string[] destKeyArray = keyMap[key];
			string[] srcKeyArray = keyMap["c-major"];
			
			int lineNum = 0;  // 当前处理的行数
			string[] lines = inputText.Lines;
			foreach (string line in lines) {
				lineNum++;
				int idx = 0;
				while (idx < line.Length) {
					string ch = line.Substring(idx, 1);
					if ((ch == " ") || (ch == "\t")) {
						idx++;
						outputText.AppendText(ch);
						continue;
					}
					if (!Regex.IsMatch(ch, "[a-g]")) {
						idx = SkipWord(line, idx);
					} else {
						int srcIdx = Array.IndexOf(srcKeyArray, ch);
						outputText.AppendText(destKeyArray[srcIdx]);
						idx++;
					}
				}
				outputText.AppendText("\n");
			}
		}
		
		private int SkipWord(string line, int idx)
		{
			while (idx < line.Length) {
				string ch = line.Substring(idx, 1);
				if ((ch == " ") || (ch == "\t")) {
					break;
				} else {
					idx++;
					outputText.AppendText(ch);
				}
			}
			return idx;
		}
		
		/// <summary>
		/// （程序启动时）在 outputText 中显示程序的帮助信息 
		/// </summary>
		private void ShowHelpMessage()
		{
			outputText.AppendText("简谱调号转换器 V1.0\n");
			outputText.AppendText("\n");
			outputText.AppendText("1. 选择“目标调号”\n");
			outputText.AppendText("2. 将按 C 调写的 LilyPond 代码拷贝到左边的文本框\n");
			outputText.AppendText("\n");
			outputText.AppendText("此文本框就会生成转换后的代码\n");
			outputText.AppendText("\n");
			outputText.AppendText("\n");
			outputText.AppendText("注意： 目前只支持从 C 调转换成指定的调。\n");
		}
		
		void CleanLogButtonClick(object sender, EventArgs e)
		{
			Logger.clean();
		}
	}
}
