using System;
using System.Linq;

namespace LinqCodeTemplate
{
    internal class Problem3
    {
        static void Main()
        {
            Product product = new Product();

            var products = product.GetProducts();

            
            // var result = products
            //              .OrderBy(p => p.ProCode)
            //              .ToList();

            var result = from p in products
             orderby p.ProCode ascending
             select p;

            foreach (var item in result)
            {
                Console.WriteLine($"{item.ProCode}\t{item.ProName}\t{item.ProMrp}");
            }

            Console.ReadLine();
        }
    }
}
