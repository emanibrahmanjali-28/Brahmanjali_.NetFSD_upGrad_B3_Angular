using System;
namespace BankAccountDetails
{
class BankAccount
{
   
    private int accountNumber;
    private decimal balance;

        public int AccountNumber
    {
        get { return accountNumber; }
        set { accountNumber = value; }
    }

       public decimal Balance
    {
        get { return balance; }
    }

    
    public BankAccount(int accNo, decimal initialBalance)
    {
        accountNumber = accNo;
        balance = initialBalance;
    }

   
    public void Deposit(decimal amount)
    {
        if (amount <= 0)
        {
            Console.WriteLine("Deposit amount must be positive.");
            return;
        }

        balance = balance + amount;
        //Console.WriteLine("Amount Deposited: " + amount);
        //Console.WriteLine("Current Balance = " + balance);
    }

        public void Withdraw(decimal amount)
    {
        if (amount <= 0)
        {
            Console.WriteLine("Withdrawal amount must be positive.");
            return;
        }

        if (amount > balance)
        {
            Console.WriteLine("Insufficient Balance.");
            return;
        }

        balance = balance - amount;
        //Console.WriteLine("Amount Withdrawn: " + amount);
        Console.WriteLine("Current Balance = " + balance);
    }
}

class Program
{
    static void Main()
    {

        BankAccount account = new BankAccount(1001, 0);

        Console.Write("Enter deposit amount: ");
        decimal depositAmount = Convert.ToDecimal(Console.ReadLine());

        account.Deposit(depositAmount);
-
        Console.Write("Enter withdrawal amount: ");
        decimal withdrawAmount = Convert.ToDecimal(Console.ReadLine());

        account.Withdraw(withdrawAmount);
    }
  }
}
