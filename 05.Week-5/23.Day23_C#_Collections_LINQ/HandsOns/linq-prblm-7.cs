using System;
using System.Linq;

namespace LinqCodeTemplate
{
    internal class Problem7
    {
        static void Main()
        {
            Product product = new Product();

            var products = product.GetProducts();

             var result = from p in products
              group p by p.ProCategory;

             foreach (var group in result)
             {
                 Console.WriteLine("Category: " + group.Key);
            
                 foreach (var item in group)
                 {
                     Console.WriteLine($"{item.ProCode}\t{item.ProName}\t{item.ProMrp}");
                 }
            
                 Console.WriteLine();
             }

            Console.ReadLine();
        }
    }
}
