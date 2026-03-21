using System;
using System.IO;

namespace DiskMonitorApp
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("===== Disk Storage Monitor =====\n");

            
            DriveInfo[] drives = DriveInfo.GetDrives();

            foreach (DriveInfo drive in drives)
            {
                try
                {
                    
                    if (drive.IsReady)
                    {
                        double totalSize = drive.TotalSize;
                        double freeSpace = drive.AvailableFreeSpace;

                       
                        double freePercent = (freeSpace / totalSize) * 100;

                        Console.WriteLine("Drive Name   : " + drive.Name);
                        Console.WriteLine("Drive Type   : " + drive.DriveType);
                        Console.WriteLine("Total Size   : " + (totalSize / (1024 * 1024 * 1024)) + " GB");
                        Console.WriteLine("Free Space   : " + (freeSpace / (1024 * 1024 * 1024)) + " GB");
                        Console.WriteLine("Free %       : " + freePercent.ToString("F2") + "%");

                        
                        if (freePercent < 15)
                        {
                            Console.WriteLine("⚠ WARNING: Low Disk Space!");
                        }

                        Console.WriteLine("----------------------------------");
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Error reading drive: " + ex.Message);
                }
            }

            Console.WriteLine("\nPress any key to exit...");
            Console.ReadKey(); 
        }
    }
}