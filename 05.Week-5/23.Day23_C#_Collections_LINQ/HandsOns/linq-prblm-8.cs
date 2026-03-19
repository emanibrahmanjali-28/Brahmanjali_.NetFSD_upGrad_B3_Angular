using System;
using System.Linq;

namespace LinqCodeTemplate
{
    internal class Problem8
    {
        static void Main()
        {
            Product product = new Product();

            var products = product.GetProducts();

           
            var result = products
                         .GroupBy(p => p.ProMrp);

            foreach (var group in result)
            {
                Console.WriteLine("MRP: " + group.Key);

                foreach (var item in group)
                {
                    Console.WriteLine($"{item.ProCode}\t{item.ProName}\t{item.ProCategory}");
                }

                Console.WriteLine(); 
            }

            Console.ReadLine();
        }
    }
}