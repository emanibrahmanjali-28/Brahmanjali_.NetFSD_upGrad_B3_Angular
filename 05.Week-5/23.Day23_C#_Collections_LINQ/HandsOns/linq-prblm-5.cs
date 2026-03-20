using System;
using System.Linq;

namespace LinqCodeTemplate
{
    internal class Problem5
    {
        static void Main()
        {
            Product product = new Product();

            var products = product.GetProducts();


            // var result = products
            //              .OrderBy(p => p.ProMrp)
            //              .ToList();

            var result = from p in products
             orderby p.ProMrp ascending
             select p;

            foreach (var item in result)
            {
                Console.WriteLine($"{item.ProCode}\t{item.ProName}\t{item.ProMrp}");
            }

            Console.ReadLine();
        }
    }
}
