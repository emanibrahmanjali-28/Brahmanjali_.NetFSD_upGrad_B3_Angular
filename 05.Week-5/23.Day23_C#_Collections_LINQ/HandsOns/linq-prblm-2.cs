using System;
using System.Linq;

namespace LinqCodeTemplate
{
    internal class Problem2
    {
        static void Main()
        {
            Product product = new Product();

            // var products = product.GetProducts();

            // var result = products
            //              .Where(p => p.ProCategory == "Grain")
            //              .ToList();



            var result = from p in products
             where p.ProCategory == "Grain"
             select p;

            foreach (var item in result)
            {
                Console.WriteLine($"{item.ProCode}\t{item.ProName}\t{item.ProMrp}");
            }

            Console.ReadLine();
        }
    }
}
