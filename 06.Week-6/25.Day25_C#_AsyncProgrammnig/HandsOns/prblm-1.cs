using System;
using System.Threading.Tasks;
namespace ConsoleApp8
{

    class Program
{
    
    static async Task WriteLogAsync(string message)
    {
        Console.WriteLine($"Start writing log: {message}");

        
        await Task.Delay(2000);

        Console.WriteLine($"Finished writing log: {message}");
    }

    static async Task Main(string[] args)
    {
        Console.WriteLine("Application Started...\n");

        
        Task log1 = WriteLogAsync("User logged in");
        Task log2 = WriteLogAsync("File uploaded");
        Task log3 = WriteLogAsync("Data processed");

        Console.WriteLine("\nMain thread is free to do other work...\n");

        
        await Task.WhenAll(log1, log2, log3);

        Console.WriteLine("\nAll logs completed.");

        
        Console.WriteLine("\nPress any key to exit...");
        Console.ReadKey();
    }
}
}