using System;

class Employee
{
    
    public string Name { get; set; }
    public double BaseSalary { get; set; }

   
    public Employee(string name, double baseSalary)
    {
        Name = name;
        BaseSalary = baseSalary;
    }

    public virtual double CalculateSalary()
    {
        return BaseSalary;
    }
}

class Manager : Employee
{
    public Manager(string name, double baseSalary) : base(name, baseSalary)
    {
    }

    public override double CalculateSalary()
    {
        double bonus = BaseSalary * 0.20;
        return BaseSalary + bonus;
    }
}

class Developer : Employee
{
    
    public Developer(string name, double baseSalary) : base(name, baseSalary)
    {
    }

 
    public override double CalculateSalary()
    {
        double bonus = BaseSalary * 0.10;
        return BaseSalary + bonus;
    }
}

class Program
{
    static void Main()
    {
       
        Console.Write("Enter Manager Name: ");
        string mName = Console.ReadLine();

        Console.Write("Enter Developer Name: ");
        string dName = Console.ReadLine();

        Console.Write("Enter Base Salary: ");
        double baseSalary = Convert.ToDouble(Console.ReadLine());

     
        if (baseSalary <= 0)
        {
            Console.WriteLine("Salary must be greater than zero");
            return;
        }

      
        Employee manager = new Manager(mName, baseSalary);
        Employee developer = new Developer(dName, baseSalary);

        Console.WriteLine("Manager Salary = " + manager.CalculateSalary());
        Console.WriteLine("Developer Salary = " + developer.CalculateSalary());
    }
}