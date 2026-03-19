using System;
using System.Linq;

namespace LinqCodeTemplate
{
    internal class Problem9
    {
        static void Main()
        {
            Product product = new Product();

            var products = product.GetProducts();

            
            var result = products
                         .Where(p => p.ProCategory == "FMCG")
                         .OrderByDescending(p => p.ProMrp)
                         .FirstOrDefault();

            if (result != null)
            {
                Console.WriteLine("Highest Price Product in FMCG:");
                Console.WriteLine($"{result.ProCode}\t{result.ProName}\t{result.ProMrp}");
            }

            Console.ReadLine();
        }
    }
}