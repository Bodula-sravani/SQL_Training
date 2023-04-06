using Microsoft.Data.SqlClient;
using System.Data;

namespace SQLConnection
{
    internal class Program
    {
        static void Main(string[] args)
        {
            string connectionString = "Data Source=DESKTOP-8C83AOT;Initial Catalog=PracticeDatabase;Integrated Security=True;Encrypt=False;";
            SqlConnection connection = new SqlConnection(connectionString);


            connection.Open();

            using(SqlCommand command = new SqlCommand("fetchdetails", connection))
            {
                // Executing store procedure without parameters
                command.CommandType = System.Data.CommandType.StoredProcedure;
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    for (int j = 0; j < reader.FieldCount; j++)
                    {
                        Console.Write(reader[j] + " ");
                    }
                    Console.WriteLine();
                }
                reader.Close();
            }

            Console.WriteLine("enter dept id , tech id and locatio to fetch employee details");
            int d_Id = int.Parse(Console.ReadLine());
            int t_Id = int.Parse(Console.ReadLine());
            string location = (Console.ReadLine().Trim());
            using (SqlCommand command = new SqlCommand("fetch_employees", connection))
            {
                // Executing store procedure with parameters
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.Add("@deptId", SqlDbType.Int).Value = d_Id;
                command.Parameters.Add("@techId", SqlDbType.Int).Value = t_Id;
                command.Parameters.Add("@locat", SqlDbType.VarChar).Value = location;
                 SqlDataReader reader =  command.ExecuteReader();
                while (reader.Read())
                {
                    for (int j = 0; j < reader.FieldCount; j++)
                    {
                        Console.Write(reader[j] + " ");
                    }
                    Console.WriteLine();
                }
                reader.Close();
            }

            //ExecuteNonquery cannot fetch results it can only do update delete but not slelect
            //ExecuteReader can fetch results








            //try
            //{
            //    Console.WriteLine("enter id to be deleted in technologies");
            //    int Techid = int.Parse(Console.ReadLine().Trim());
            //    command1.CommandText = $"select count(*) from technologies where id={Techid}";
            //    int count = (int)command1.ExecuteScalar();
            //    if (count > 0)
            //    {
            //        command1.CommandText = $"delete from technologies where id={Techid}";
            //        command1.ExecuteReader().Close();
            //        Console.WriteLine("Deleted");
            //    }
            //    else
            //    {
            //        Console.WriteLine("Employee doesnt exist");
            //    }
            //}
            //catch (SqlException e)
            //{
            //    Console.WriteLine($"Error: {e.Message}");

            //}
            //catch (FormatException e)
            //{
            //    Console.WriteLine($"Format Error: {e.Message}");
            //}
            //catch(InvalidOperationException e)
            //{
            //    Console.WriteLine($"Error: {e.Message}");
            //}



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
            //SqlCommand command1 = connection.CreateCommand();
            //command1.CommandText = $"select * from technologies";
            //SqlDataReader reader1 = command1.ExecuteReader();
            //Console.WriteLine($"Id       Name");
            //while (reader1.Read())
            //{
            //    Console.WriteLine($"{reader1.GetInt32(0)}        {reader1.GetString(1)}");
            //}
            //reader1.Close();



            connection.Close();
        }
    }
}