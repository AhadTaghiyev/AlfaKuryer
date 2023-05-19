﻿// <auto-generated />
using System;
using AlfaKuryer.Persistance.Context;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

#nullable disable

namespace AlfaKuryer.Persistance.Migrations
{
    [DbContext(typeof(AlfaKuryerDbContext))]
    partial class AlfaKuryerDbContextModelSnapshot : ModelSnapshot
    {
        protected override void BuildModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "7.0.5")
                .HasAnnotation("Relational:MaxIdentifierLength", 64);

            modelBuilder.Entity("AlfaKuryer.Domain.Entities.Setting", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    b.Property<string>("Adress")
                        .IsRequired()
                        .HasColumnType("longtext");

                    b.Property<DateTime>("CreatedAt")
                        .HasColumnType("datetime(6)");

                    b.Property<string>("Email")
                        .IsRequired()
                        .HasColumnType("longtext");

                    b.Property<string>("FaceBookLink")
                        .IsRequired()
                        .HasColumnType("longtext");

                    b.Property<string>("InstgaramLink")
                        .IsRequired()
                        .HasColumnType("longtext");

                    b.Property<bool>("IsDeleted")
                        .HasColumnType("tinyint(1)");

                    b.Property<string>("Logo")
                        .IsRequired()
                        .HasColumnType("longtext");

                    b.Property<string>("PhoneNumber1")
                        .IsRequired()
                        .HasColumnType("longtext");

                    b.Property<string>("PhoneNumber2")
                        .IsRequired()
                        .HasColumnType("longtext");

                    b.Property<DateTime>("UpdatedAt")
                        .HasColumnType("datetime(6)");

                    b.Property<string>("YoutubeLink")
                        .IsRequired()
                        .HasColumnType("longtext");

                    b.HasKey("Id");

                    b.ToTable("Settings");
                });
#pragma warning restore 612, 618
        }
    }
}