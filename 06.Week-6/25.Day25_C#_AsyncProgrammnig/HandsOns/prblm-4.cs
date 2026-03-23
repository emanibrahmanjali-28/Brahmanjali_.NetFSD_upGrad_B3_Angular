using System;
using System.Threading.Tasks;

namespace ConsoleApp8
{
    class Program
    {
        
        static async Task VerifyPaymentAsync()
        {
            Console.WriteLine("Payment verification started...");
            await Task.Delay(2000); 
            Console.WriteLine("Payment verified.");
        }

       
        static async Task CheckInventoryAsync()
        {
            Console.WriteLine("Inventory check started...");
            await Task.Delay(3000); 
            Console.WriteLine("Inventory available.");
        }

       
        static async Task ConfirmOrderAsync()
        {
            Console.WriteLine("Order confirmation started...");
            await Task.Delay(1500); 
            Console.WriteLine("Order confirmed.");
        }

        
        static async Task Main(string[] args)
        {
            Console.WriteLine("Order processing started...\n");

            
            await VerifyPaymentAsync();
            await CheckInventoryAsync();
            await ConfirmOrderAsync();

            Console.WriteLine("\nOrder processing completed successfully!");

            
            Console.WriteLine("\nPress any key to exit...");
            Console.ReadKey();
        }
    }
}