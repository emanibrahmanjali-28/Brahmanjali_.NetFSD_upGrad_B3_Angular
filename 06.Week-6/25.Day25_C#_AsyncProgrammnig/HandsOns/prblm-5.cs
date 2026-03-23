using System;
using System.Diagnostics;

namespace ConsoleApp8
{
    class Program
    {
        static void Main(string[] args)
        {
           
            Trace.Listeners.Clear();
            Trace.Listeners.Add(new TextWriterTraceListener("OrderLog.txt"));
            Trace.AutoFlush = true;

            Console.WriteLine("Order Processing Started...\n");

            try
            {
                ValidateOrder();
                ProcessPayment();
                UpdateInventory();
                GenerateInvoice();

                Console.WriteLine("\nOrder processed successfully!");
                Trace.TraceInformation("Order processed successfully.");
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error occurred: " + ex.Message);
                Trace.WriteLine("ERROR: " + ex.Message);
            }

            Console.WriteLine("\nPress any key to exit...");
            Console.ReadKey();
        }

       
        static void ValidateOrder()
        {
            Trace.WriteLine("Step 1: Validating Order...");
            Console.WriteLine("Validating Order...");
        }

        
        static void ProcessPayment()
        {
            Trace.TraceInformation("Step 2: Processing Payment...");
            Console.WriteLine("Processing Payment...");
        }

        
        static void UpdateInventory()
        {
            Trace.WriteLine("Step 3: Updating Inventory...");
            Console.WriteLine("Updating Inventory...");
        }

        
        static void GenerateInvoice()
        {
            Trace.TraceInformation("Step 4: Generating Invoice...");
            Console.WriteLine("Generating Invoice...");
        }
    }
}