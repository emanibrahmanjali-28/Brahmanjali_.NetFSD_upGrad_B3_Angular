using System;
using System.IO;

namespace ConsoleApp8
{
    class Program
    {
        static void Main(string[] args)
        {
            try
            {
                Console.WriteLine("Enter Root Directory Path:");
                string path = Console.ReadLine();

                if (string.IsNullOrWhiteSpace(path))
                {
                    Console.WriteLine("Path cannot be empty!");
                    Console.ReadKey();
                    return;
                }

                DirectoryInfo rootDir = new DirectoryInfo(path);

                if (!rootDir.Exists)
                {
                    Console.WriteLine("Directory does not exist!");
                    Console.ReadKey();
                    return;
                }

                Console.WriteLine("\nSubdirectories and File Count:\n");

                DirectoryInfo[] directories = rootDir.GetDirectories();

                if (directories.Length == 0)
                {
                    Console.WriteLine("No subdirectories found.");
                }

                foreach (DirectoryInfo dir in directories)
                {
                    FileInfo[] files = dir.GetFiles();

                    Console.WriteLine("Folder Name: " + dir.Name);
                    Console.WriteLine("Number of Files: " + files.Length);
                    Console.WriteLine("-----------------------------");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex.Message);
            }

            
            Console.WriteLine("\nPress any key to exit...");
            Console.ReadKey();
        }
    }
}