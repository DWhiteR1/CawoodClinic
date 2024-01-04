namespace CawoodClinic.Blazor.ExtensionMethods;

using System;
using System.Collections.Generic;
using System.Linq;

public static class ListExtensions
{
    public static void AddOrUpdate<T>(
        this List<T> list,
        T newItem)
        where T : IEquatable<T>
    {
        int index = list.FindIndex(existingItem => existingItem.Equals(newItem));

        if (index != -1)
        {
            // Item found, replace it with the new item.
            list[index] = newItem;
        }
        else
        {
            // Item not found, so add the new item to the list.
            list.Add(newItem);
        }
    }
}

