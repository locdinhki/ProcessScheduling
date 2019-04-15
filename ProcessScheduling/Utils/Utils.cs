using ProcessScheduling.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProcessScheduling.Utils
{
    public static class Utils
    {
        public static string FullText(Models.Part part)
        {
            return part.Code + " - " + part.Name;
        }

        public static double GetCycleTime(Models.Equipment equipment)
        {
            return (equipment.ProductionRunTime * 3600)/(equipment.ProductionCapacity - (equipment.RunCapacity * equipment.FirstPassYield));
        }

        public static double GetCycleTime(Models.WorkStation workStation)
        {
            double result = 0.0;
            foreach (Models.Equipment equipment in workStation.Equipments)
            {
                if (result < GetCycleTime(equipment))
                {
                    result = GetCycleTime(equipment);
                }
            }
            return result;
        }

        public static double GetCycleTime(Models.Line line)
        {
            double result = 0.0;
            foreach (Models.WorkStation workStation in line.WorkStations)
            {
                if (result < GetCycleTime(workStation))
                {
                    result = GetCycleTime(workStation);
                }
            }
            return result;
        }

        public static double GetTotalUPH(Models.Part part)
        {
            double result = 0.0;
            List<Equipment> equipments = new List<Equipment>();
            //List<Molding> moldings = new List<Molding>();
            foreach (Molding molding in part.Moldings)
            {
                foreach (EquipmentCategory equipmentCategory in molding.EquipmentCategories)
                {
                    equipments.AddRange(equipmentCategory.Equipments);
                }
            }
            foreach(Equipment equipment in equipments.Distinct())
            {
                result += Utils.GetUPH(equipment);
            }

            return result;
        }

        public static double GetUPH(Equipment equipment)
        {
            return equipment.ProductionCapacity / equipment.ProductionRunTime;
        }
    }
}