using Microsoft.Data.SqlClient;

namespace SQLConnection
{
    internal class Program
    {
        static void Main(string[] args)
        {
            //string connectionString = "Data Source=DESKTOP-8C83AOT;Initial Catalog=PracticeDatabase;Integrated Security=True;Connect Timeout=30;Encrypt=False;Trust Server Certificate=False;Application Intent=ReadWrite;Multi Subnet Failover=False";
            string connectionString = "Data Source=DESKTOP-8C83AOT;Initial Catalog=PracticeDatabase;Integrated Security=True;Encrypt=False;";
            SqlConnection connection = new SqlConnection(connectionString);


            connection.Open();
            SqlCommand command1 = connection.CreateCommand();

            try
            {
                Console.WriteLine("enter id to be deleted in technologies");
                int Techid = int.Parse(Console.ReadLine().Trim());
                command1.CommandText = $"select count(*) from technologies where id={Techid}";
                int count = (int)command1.ExecuteScalar();
                if (count > 0)
                {
                    command1.CommandText = $"delete from technologies where id={Techid}";
                    command1.ExecuteReader().Close();
                    Console.WriteLine("Deleted");
                }
                else
                {
                    Console.WriteLine("Employee doesnt exist");
                }
            }
            catch (SqlException e)
            {
                Console.WriteLine($"Error: {e.Message}");

            }
            catch (FormatException e)
            {
                Console.WriteLine($"Format Error: {e.Message}");
            }
            catch(InvalidOperationException e)
            {
                Console.WriteLine($"Error: {e.Message}");
            }
            //Console.WriteLine("Enter Id and name of technology to insert");
            //int TechId = int.Parse( Console.ReadLine() );   
            //string TechName = Console.ReadLine().Trim();
            //command1.CommandText = $"insert into technologies values({TechId},'{TechName}')";
            //command1.ExecuteReader().Close();

            //// To read row by row with all columns
            ////while (reader.Read())
            ////{
            ////    for (int j = 0; j < reader.FieldCount; j++)
            ////    {
            ////        Console.Write(reader[j] + " ");
            ////    }
            ////    Console.WriteLine();
            ////    i++;
            ////}


            //Console.WriteLine("Enter technology name to be searchedd");
            //TechName = Console.ReadLine().Trim();
            command1.CommandText = $"select * from technologies";
            SqlDataReader reader = command1.ExecuteReader();
            Console.WriteLine($"Id       Name");
            while (reader.Read())
            {
                Console.WriteLine($"{reader.GetInt32(0)}        {reader.GetString(1)}");
            }
            reader.Close();



            connection.Close();
        }
    }
}