/*
 * Created by SharpDevelop.
 * User: fht
 * Date: 2018/8/18
 * Time: 14:55
 * 
 * 根据指定的行数，将文本文件分割成若干个小文件。
 * 
 * 使用方法： 
 *    Spliter  filepath  line1 [ line2 ...]
 * 
 * 如：
 *    Spliter abc.txt 100
 * 将文件 abc.txt 分割为两个文件：
 *    abc_1.txt ：从 1 到 99 行
 *    abc_2.txt ：从 100 行 到文件末尾
 */
using System;
using System.IO;
using System.Text;

namespace Spliter
{
	class Program
	{
		public static void Main(string[] args)
		{
			string filePath = args[0];
			Console.WriteLine("src file: " + filePath);
			
			int start = 1;
			int stop = 0;
			int count = 1;
			
			for (int i = 1; i <= args.Length; i++) {
				stop = (i == args.Length) ? int.MaxValue : int.Parse(args[i]);
				split(filePath, count, start, stop);
				start = stop;
				count++;
			}
			
			Console.Write("Press any key to continue . . . ");
			Console.ReadKey(true);
		}
		
		private static void split(string filePath, int count, int start, int stop)
		{
			string path = Path.GetDirectoryName(filePath);
			string name = Path.GetFileNameWithoutExtension(filePath);
			string ext = Path.GetExtension(filePath);
			string destFile = path + Path.DirectorySeparatorChar + name + "_" + count + ext;
			string stopStr = (stop == int.MaxValue) ? "EOF" : ""+stop;
			Console.WriteLine("Write to file: " + destFile + ", from " + start + " to " + stopStr);
			
			int lineNum = 0;
			using (StreamReader reader = new StreamReader(filePath, Encoding.UTF8))
				using (StreamWriter writer = new StreamWriter(destFile, false, Encoding.UTF8))
			{
				string line;
				while ((line = reader.ReadLine()) != null) {
					lineNum++;
					if (lineNum < start) {
						continue;
					}
					if (lineNum >= stop) {
						break;
					} else {
						writer.WriteLine(line);
					}
				}
			}
		}
	}
}