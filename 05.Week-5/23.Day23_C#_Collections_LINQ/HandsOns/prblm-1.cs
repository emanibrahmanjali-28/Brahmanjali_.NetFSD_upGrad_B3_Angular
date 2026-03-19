using System;                      
using System.Collections.Generic; 

class Program
{
    static void Main()
    {
        // List to store tasks
        List<string> tasks = new List<string>(); 

        while (true) 
        {
            Console.WriteLine("To-Do List Manager");
            Console.WriteLine("1. Add Task");
            Console.WriteLine("2. View Tasks");
            Console.WriteLine("3. Remove Task");
            Console.WriteLine("4. Exit");
            Console.Write("Choose an option: ");

            string input = Console.ReadLine(); 

            
            if (!int.TryParse(input, out int choice))
            {
                Console.WriteLine("Invalid input! Please enter a number (1-4).");
                continue; 
            }

            switch (choice)
            {
                case 1:
                    AddTask(tasks);
                    break;

                case 2:
                    ViewTasks(tasks);
                    break;

                case 3:
                    RemoveTask(tasks);
                    break;

                case 4:
                    Console.WriteLine("Exiting application...");
                    return; 

                default:
                    Console.WriteLine("Invalid choice! Please select 1-4.");
                    break;
            }
        }
    }

  
    static void AddTask(List<string> tasks)
    {
        Console.Write("Enter task: ");
        string task = Console.ReadLine();

       
        if (string.IsNullOrWhiteSpace(task))
        {
            Console.WriteLine("Task cannot be empty!");
            return;
        }

        tasks.Add(task);
        Console.WriteLine("Task added!");
    }

    
    static void ViewTasks(List<string> tasks)
    {
        if (tasks.Count == 0) 
        {
            Console.WriteLine("No tasks available.");
            return;
        }

        Console.WriteLine("Tasks:");

        
        for (int i = 0; i < tasks.Count; i++)
        {
            Console.WriteLine($"{i + 1}. {tasks[i]}"); /
        }
    }

    //validation method for remove
    static void RemoveTask(List<string> tasks)
    {
        if (tasks.Count == 0)
        {
            Console.WriteLine("No tasks to remove.");
            return;
        }

        Console.Write("Enter task number to remove: ");
        string input = Console.ReadLine();

       
        if (!int.TryParse(input, out int taskNumber))
        {
            Console.WriteLine("Invalid input! Please enter a number.");
            return;
        }

        if (taskNumber < 1 || taskNumber > tasks.Count)
        {
            Console.WriteLine("Invalid task number.");
            return;
        }

        string removedTask = tasks[taskNumber - 1]; 
        tasks.RemoveAt(taskNumber - 1);             

        Console.WriteLine($"Removed: {removedTask}");
    }
}