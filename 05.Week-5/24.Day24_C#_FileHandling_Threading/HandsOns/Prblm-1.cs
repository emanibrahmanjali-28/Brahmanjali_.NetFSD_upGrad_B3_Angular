using System;
using System.IO;
using System.Text;


namespace ConsoleApp8
{
    class Program
{
    static void Main()
    {
        string filePath = "log.txt";

        try
        {
            while (true)
            {
                Console.Write("Enter your log message (type 'exit' to stop): ");
                string message = Console.ReadLine();

                if (message.ToLower() == "exit")
                    break;

                byte[] data = Encoding.UTF8.GetBytes(message + Environment.NewLine);

                using (FileStream fs = new FileStream(filePath, FileMode.Append, FileAccess.Write))
                {
                    fs.Write(data, 0, data.Length);
                }

                Console.WriteLine("Message written successfully!\n");
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