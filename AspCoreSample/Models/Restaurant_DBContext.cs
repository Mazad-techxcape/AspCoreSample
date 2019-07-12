using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace AspCoreSample.Models
{
    public partial class Restaurant_DBContext : DbContext
    {
        public Restaurant_DBContext()
        {
        }

        public Restaurant_DBContext(DbContextOptions<Restaurant_DBContext> options)
            : base(options)
        {
        }

        public virtual DbSet<MenuCategory> MenuCategory { get; set; }
       

        // Unable to generate entity type for table 'dbo.RestaurantInfo'. Please see the warning messages.

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseSqlServer("Server=.;Database=Restaurant_DB;Trusted_Connection=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            // First we identify the model-types by examining the properties in the DbContext class
            // Here, I am assuming that your DbContext class is called "DataContext"
            var modelTypes = typeof(Restaurant_DBContext).GetProperties()
                             .Where(x => x.PropertyType.IsGenericType && x.PropertyType.GetGenericTypeDefinition() == typeof(DbSet<>))
                             .Select(x => x.PropertyType.GetGenericArguments().First())
                             .ToList();

            // Feel free to add any other possible types you may have defined your "Id" property with
            // Here I am assuming that only short, int, and bigint would be considered identity
            var identityTypes = new List<Type> { typeof(Int16), typeof(Int32), typeof(Int64) };

            foreach (Type modelType in modelTypes)
            {
                // Find the first property that is named "id" with the types defined in identityTypes collection
                var key = modelType.GetProperties()
                                   .FirstOrDefault(x => x.Name.Equals("Menucategoryid", StringComparison.CurrentCultureIgnoreCase) && identityTypes.Contains(x.PropertyType));

                // Once we know a matching property is found
                // We set the propery as Identity using UseSqlServerIdentityColumn() method
                if (key == null)
                {
                    continue;
                }

                // Here we identify the Id property to be set to Identity
                // Also, we use change the PropertySaveBehavior on the same
                // property to ignore the values 
                modelBuilder.Entity(modelType)
                            .Property(key.Name)
                            .UseSqlServerIdentityColumn()
                            .Metadata.BeforeSaveBehavior = PropertySaveBehavior.Ignore;
            }
        }
    }
}
