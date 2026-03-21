using System.IO;

namespace ConsoleApp8
{
    using System;
    using System.IO;

    class FileAudit
    {
        static void Main()
        {
            try
            {
                Console.Write("Enter folder path: ");
                string folderPath = Console.ReadLine();

                if (!Directory.Exists(folderPath))
                {
                    Console.WriteLine("Invalid directory path!");
                    return;
                }

                // all files including subfolders
                string[] files = Directory.GetFiles(folderPath, "*.*", SearchOption.AllDirectories);

                if (files.Length == 0)
                {
                    Console.WriteLine("No files found.");
                    return;
                }

                Console.WriteLine("\nFile Details:\n");

                int count = 0;

                foreach (string file in files)
                {
                    FileInfo fi = new FileInfo(file);

                    Console.WriteLine("File Name   : " + fi.Name);
                    Console.WriteLine("File Size   : " + fi.Length + " bytes");
                    Console.WriteLine("Created Date: " + fi.CreationTime);
                    Console.WriteLine("Path        : " + fi.FullName);
                    Console.WriteLine("----------------------------------");

                    count++;
                }

                Console.WriteLine("\nTotal Files: " + count);
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex.Message);
            }
        }
    }

}
