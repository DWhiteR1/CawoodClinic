namespace CawoodClinic.Shared.Serialization;

using System.Reflection;
using System.Text.Json;
using System.Text.Json.Serialization;

using OneOf;


public class OneOfConverterFactory : JsonConverterFactory
{
    public override bool CanConvert(Type typeToConvert)
      => typeof(IOneOf).IsAssignableFrom(typeToConvert);

    public override JsonConverter CreateConverter(Type? typeToConvert, JsonSerializerOptions options)
    {
        var (oneOfGenericType, converterType) = GetTypes(typeToConvert);
        if (oneOfGenericType is null || converterType is null)
        {
            throw new NotSupportedException($"Cannot convert {typeToConvert}");
        }

        var jsonConverter = (JsonConverter)Activator.CreateInstance(
          converterType.MakeGenericType(oneOfGenericType.GenericTypeArguments),
          BindingFlags.Instance | BindingFlags.Public,
          null,
          new object[] { options },
          null)!;

        return jsonConverter;
    }

    static (Type? oneOfGenericType, Type? converterType) GetTypes(Type? type)
    {
        while (type is not null)
        {
            if (type.IsGenericType)
            {
                var genericTypeDefinition = type.GetGenericTypeDefinition();
                if (genericTypeDefinition == typeof(OneOfBase<,>) ||
                    genericTypeDefinition == typeof(OneOf<,>))
                {
                    return (type, typeof(OneOf2JsonConverter<,>));
                }

                if (genericTypeDefinition == typeof(OneOfBase<,,>) ||
                    genericTypeDefinition == typeof(OneOf<,,>))
                {
                    return (type, typeof(OneOf3JsonConverter<,,>));
                }

                 if (genericTypeDefinition == typeof(OneOfBase<,,,>) ||
                     genericTypeDefinition == typeof(OneOf<,,,>))
                {
                    return (type, typeof(OneOf4JsonConverter<,,,>));
                }

                if (genericTypeDefinition == typeof(OneOfBase<,,,,>) ||
                    genericTypeDefinition == typeof(OneOf<,,,,>))
                {
                    return (type, typeof(OneOf5JsonConverter<,,,,>));
                }

                if (genericTypeDefinition == typeof(OneOfBase<,,,,,>) ||
                    genericTypeDefinition == typeof(OneOf<,,,,,>))
                {
                    return (type, typeof(OneOf6JsonConverter<,,,,,>));
                }

                if (genericTypeDefinition == typeof(OneOfBase<,,,,,,>) ||
                    genericTypeDefinition == typeof(OneOf<,,,,,,>))
                {
                    return (type, typeof(OneOf7JsonConverter<,,,,,,>));
                }

                if (genericTypeDefinition == typeof(OneOfBase<,,,,,,,>) ||
                    genericTypeDefinition == typeof(OneOf<,,,,,,,>))
                {
                    return (type, typeof(OneOf8JsonConverter<,,,,,,,>));
                }

                if (genericTypeDefinition == typeof(OneOfBase<,,,,,,,,>) ||
                    genericTypeDefinition == typeof(OneOf<,,,,,,,,>))
                {
                    return (type, typeof(OneOf9JsonConverter<,,,,,,,,>));
                }
            }

            type = type.BaseType;
        }

        return (null, null);
    }

    static IOneOf CreateOneOf(JsonSerializerOptions options, int index, JsonDocument doc, Type oneOfType, Type[] types)
    {
        var args = new object[types.Length + 1];
        args[0] = index;
        args[index + 1] = doc.Deserialize(types[index], options);

        var oneOf = Activator.CreateInstance(
          oneOfType,
          BindingFlags.Instance | BindingFlags.NonPublic,
          null,
          args,
          null
        );

        return (IOneOf)oneOf;
    }

    const string IndexKey = "$index";

    class OneOf2JsonConverter<T0, T1> : JsonConverter<OneOfBase<T0, T1>>
    {
        static readonly Type OneOfType = typeof(OneOf<,>).MakeGenericType(typeof(T0), typeof(T1));
        static readonly Type[] Types = { typeof(T0), typeof(T1) };

        public OneOf2JsonConverter(JsonSerializerOptions _)
        {
        }

        public override OneOfBase<T0, T1> Read(ref Utf8JsonReader reader,
                                               Type typeToConvert,
                                               JsonSerializerOptions options)
        {
            using var doc = JsonDocument.ParseValue(ref reader);
            if (!doc.RootElement.TryGetProperty(IndexKey, out var indexElement) ||
                !indexElement.TryGetInt32(out var index) ||
                index is < 0 or > 1)
            {
                throw new JsonException("Cannot not find type index or type index is not a valid number");
            }

            var oneOf = CreateOneOf(options, index, doc, OneOfType, Types);

            return (OneOfBase<T0, T1>)Activator.CreateInstance(typeToConvert, oneOf);
        }

        public override void Write(Utf8JsonWriter writer,
                                   OneOfBase<T0, T1> value,
                                   JsonSerializerOptions options)
        {
            writer.WriteStartObject();

            writer.WritePropertyName(IndexKey);
            writer.WriteNumberValue(value.Index);

            using var doc = value.Match(
              t0 => JsonSerializer.SerializeToDocument(t0, typeof(T0), options),
              t1 => JsonSerializer.SerializeToDocument(t1, typeof(T1), options)
            );

            foreach (var prop in doc.RootElement.EnumerateObject())
            {
                prop.WriteTo(writer);
            }

            writer.WriteEndObject();
        }
    }

    class OneOf3JsonConverter<T0, T1, T2> : JsonConverter<OneOfBase<T0, T1, T2>>
    {
        static readonly Type OneOfType = typeof(OneOf<,,>).MakeGenericType(typeof(T0), typeof(T1), typeof(T2));
        static readonly Type[] Types = { typeof(T0), typeof(T1), typeof(T2) };

        public OneOf3JsonConverter(JsonSerializerOptions _)
        {
        }

        public override OneOfBase<T0, T1, T2> Read(ref Utf8JsonReader reader,
                                                   Type typeToConvert,
                                                   JsonSerializerOptions options)
        {
            using var doc = JsonDocument.ParseValue(ref reader);
            if (!doc.RootElement.TryGetProperty(IndexKey, out var indexElement) ||
                !indexElement.TryGetInt32(out var index) ||
                index is < 0 or > 2)
            {
                throw new JsonException("Cannot not find type index or type index is not a valid number");
            }

            var oneOfBase = CreateOneOf(options, index, doc, OneOfType, Types);

            return (OneOfBase<T0, T1, T2>)Activator.CreateInstance(typeToConvert, oneOfBase);
        }

        public override void Write(Utf8JsonWriter writer,
                                   OneOfBase<T0, T1, T2> value,
                                   JsonSerializerOptions options)
        {
            writer.WriteStartObject();

            writer.WritePropertyName(IndexKey);
            writer.WriteNumberValue(value.Index);

            using var doc = value.Match(
              t0 => JsonSerializer.SerializeToDocument(t0, typeof(T0), options),
              t1 => JsonSerializer.SerializeToDocument(t1, typeof(T1), options),
              t2 => JsonSerializer.SerializeToDocument(t2, typeof(T2), options)
            );

            foreach (var prop in doc.RootElement.EnumerateObject())
            {
                prop.WriteTo(writer);
            }

            writer.WriteEndObject();
        }
    }

    class OneOf4JsonConverter<T0, T1, T2, T3> : JsonConverter<OneOfBase<T0, T1, T2, T3>>
    {
        static readonly Type OneOfType = typeof(OneOf<,,,>).MakeGenericType(typeof(T0), typeof(T1), typeof(T2), typeof(T3));
        static readonly Type[] Types = { typeof(T0), typeof(T1), typeof(T2), typeof(T3) };

        public OneOf4JsonConverter(JsonSerializerOptions _)
        {
        }

        public override OneOfBase<T0, T1, T2, T3> Read(ref Utf8JsonReader reader,
                                                       Type typeToConvert,
                                                       JsonSerializerOptions options)
        {
            using var doc = JsonDocument.ParseValue(ref reader);
            if (!doc.RootElement.TryGetProperty(IndexKey, out var indexElement) ||
                !indexElement.TryGetInt32(out var index) ||
                index is < 0 or > 3)
            {
                throw new JsonException("Cannot not find type index or type index is not a valid number");
            }

            var oneOfBase = CreateOneOf(options, index, doc, OneOfType, Types);

            return (OneOfBase<T0, T1, T2, T3>)Activator.CreateInstance(typeToConvert, oneOfBase);
        }

        public override void Write(Utf8JsonWriter writer,
                                   OneOfBase<T0, T1, T2, T3> value,
                                   JsonSerializerOptions options)
        {
            writer.WriteStartObject();

            writer.WritePropertyName(IndexKey);
            writer.WriteNumberValue(value.Index);

            using var doc = value.Match(
              t0 => JsonSerializer.SerializeToDocument(t0, typeof(T0), options),
              t1 => JsonSerializer.SerializeToDocument(t1, typeof(T1), options),
              t2 => JsonSerializer.SerializeToDocument(t2, typeof(T2), options),
              t3 => JsonSerializer.SerializeToDocument(t3, typeof(T3), options)
            );

            foreach (var prop in doc.RootElement.EnumerateObject())
            {
                prop.WriteTo(writer);
            }

            writer.WriteEndObject();
        }
    }

    class OneOf5JsonConverter<T0, T1, T2, T3, T4> : JsonConverter<OneOfBase<T0, T1, T2, T3, T4>>
    {
        static readonly Type OneOfType = typeof(OneOf<,,,,>).MakeGenericType(typeof(T0), typeof(T1), typeof(T2), typeof(T3), typeof(T4));
        static readonly Type[] Types = { typeof(T0), typeof(T1), typeof(T2), typeof(T3), typeof(T4) };

        public OneOf5JsonConverter(JsonSerializerOptions _)
        {
        }

        public override OneOfBase<T0, T1, T2, T3, T4> Read(ref Utf8JsonReader reader,
                                                          Type typeToConvert,
                                                          JsonSerializerOptions options)
        {
            using var doc = JsonDocument.ParseValue(ref reader);
            if (!doc.RootElement.TryGetProperty(IndexKey, out var indexElement) ||
                !indexElement.TryGetInt32(out var index) ||
                index is < 0 or > 4)
            {
                throw new JsonException("Cannot not find type index or type index is not a valid number");
            }

            var oneOfBase = CreateOneOf(options, index, doc, OneOfType, Types);

            return (OneOfBase<T0, T1, T2, T3, T4>)Activator.CreateInstance(typeToConvert, oneOfBase);
        }

        public override void Write(Utf8JsonWriter writer,
                                   OneOfBase<T0, T1, T2, T3, T4> value,
                                   JsonSerializerOptions options)
        {
            writer.WriteStartObject();

            writer.WritePropertyName(IndexKey);
            writer.WriteNumberValue(value.Index);

            using var doc = value.Match(
              t0 => JsonSerializer.SerializeToDocument(t0, typeof(T0), options),
              t1 => JsonSerializer.SerializeToDocument(t1, typeof(T1), options),
              t2 => JsonSerializer.SerializeToDocument(t2, typeof(T2), options),
              t3 => JsonSerializer.SerializeToDocument(t3, typeof(T3), options),
              t4 => JsonSerializer.SerializeToDocument(t4, typeof(T4), options)
            );

            foreach (var prop in doc.RootElement.EnumerateObject())
            {
                prop.WriteTo(writer);
            }

            writer.WriteEndObject();
        }
    }

    class OneOf6JsonConverter<T0, T1, T2, T3, T4, T5> : JsonConverter<OneOfBase<T0, T1, T2, T3, T4, T5>>
    {
        static readonly Type OneOfType = typeof(OneOf<,,,,,>).MakeGenericType(typeof(T0), typeof(T1), typeof(T2), typeof(T3), typeof(T4), typeof(T5));
        static readonly Type[] Types = { typeof(T0), typeof(T1), typeof(T2), typeof(T3), typeof(T4), typeof(T5) };

        public OneOf6JsonConverter(JsonSerializerOptions _)
        {
        }

        public override OneOfBase<T0, T1, T2, T3, T4, T5> Read(ref Utf8JsonReader reader,
                                                               Type typeToConvert,
                                                               JsonSerializerOptions options)
        {
            using var doc = JsonDocument.ParseValue(ref reader);
            if (!doc.RootElement.TryGetProperty(IndexKey, out var indexElement) ||
                !indexElement.TryGetInt32(out var index) ||
                index is < 0 or > 5)
            {
                throw new JsonException("Cannot not find type index or type index is not a valid number");
            }

            var oneOfBase = CreateOneOf(options, index, doc, OneOfType, Types);

            return (OneOfBase<T0, T1, T2, T3, T4, T5>)Activator.CreateInstance(typeToConvert, oneOfBase);
        }

        public override void Write(Utf8JsonWriter writer,
                                   OneOfBase<T0, T1, T2, T3, T4, T5> value,
                                   JsonSerializerOptions options)
        {
            writer.WriteStartObject();

            writer.WritePropertyName(IndexKey);
            writer.WriteNumberValue(value.Index);

            using var doc = value.Match(
              t0 => JsonSerializer.SerializeToDocument(t0, typeof(T0), options),
              t1 => JsonSerializer.SerializeToDocument(t1, typeof(T1), options),
              t2 => JsonSerializer.SerializeToDocument(t2, typeof(T2), options),
              t3 => JsonSerializer.SerializeToDocument(t3, typeof(T3), options),
              t4 => JsonSerializer.SerializeToDocument(t4, typeof(T4), options),
              t5 => JsonSerializer.SerializeToDocument(t5, typeof(T5), options)
            );

            foreach (var prop in doc.RootElement.EnumerateObject())
            {
                prop.WriteTo(writer);
            }

            writer.WriteEndObject();
        }
    }

    class OneOf7JsonConverter<T0, T1, T2, T3, T4, T5, T6> : JsonConverter<OneOfBase<T0, T1, T2, T3, T4, T5, T6>>
    {
        static readonly Type OneOfType = typeof(OneOf<,,,,,,>).MakeGenericType(typeof(T0), typeof(T1), typeof(T2), typeof(T3), typeof(T4), typeof(T5), typeof(T6));
        static readonly Type[] Types = { typeof(T0), typeof(T1), typeof(T2), typeof(T3), typeof(T4), typeof(T5), typeof(T6) };

        public OneOf7JsonConverter(JsonSerializerOptions _)
        {
        }

        public override OneOfBase<T0, T1, T2, T3, T4, T5, T6> Read(ref Utf8JsonReader reader,
                                                                     Type typeToConvert,
                                                                     JsonSerializerOptions options)
        {
            using var doc = JsonDocument.ParseValue(ref reader);
            if (!doc.RootElement.TryGetProperty(IndexKey, out var indexElement) ||
                !indexElement.TryGetInt32(out var index) ||
                index is < 0 or > 6)
            {
                throw new JsonException("Cannot not find type index or type index is not a valid number");
            }

            var oneOfBase = CreateOneOf(options, index, doc, OneOfType, Types);

            return (OneOfBase<T0, T1, T2, T3, T4, T5, T6>)Activator.CreateInstance(typeToConvert, oneOfBase);
        }

        public override void Write(Utf8JsonWriter writer,
                                   OneOfBase<T0, T1, T2, T3, T4, T5, T6> value,
                                   JsonSerializerOptions options)
        {
            writer.WriteStartObject();

            writer.WritePropertyName(IndexKey);
            writer.WriteNumberValue(value.Index);

            using var doc = value.Match(
              t0 => JsonSerializer.SerializeToDocument(t0, typeof(T0), options),
              t1 => JsonSerializer.SerializeToDocument(t1, typeof(T1), options),
              t2 => JsonSerializer.SerializeToDocument(t2, typeof(T2), options),
              t3 => JsonSerializer.SerializeToDocument(t3, typeof(T3), options),
              t4 => JsonSerializer.SerializeToDocument(t4, typeof(T4), options),
              t5 => JsonSerializer.SerializeToDocument(t5, typeof(T5), options),
              t6 => JsonSerializer.SerializeToDocument(t6, typeof(T6), options)
            );

            foreach (var prop in doc.RootElement.EnumerateObject())
            {
                prop.WriteTo(writer);
            }

            writer.WriteEndObject();
        }
    }

    class OneOf8JsonConverter<T0, T1, T2, T3, T4, T5, T6, T7> : JsonConverter<OneOfBase<T0, T1, T2, T3, T4, T5, T6, T7>>
    {
        static readonly Type OneOfType = typeof(OneOf<,,,,,,,>).MakeGenericType(typeof(T0), typeof(T1), typeof(T2), typeof(T3), typeof(T4), typeof(T5), typeof(T6), typeof(T7));
        static readonly Type[] Types = { typeof(T0), typeof(T1), typeof(T2), typeof(T3), typeof(T4), typeof(T5), typeof(T6), typeof(T7) };

        public OneOf8JsonConverter(JsonSerializerOptions _)
        {
        }

        public override OneOfBase<T0, T1, T2, T3, T4, T5, T6, T7> Read(ref Utf8JsonReader reader,
                                                                         Type typeToConvert,
                                                                         JsonSerializerOptions options)
        {
            using var doc = JsonDocument.ParseValue(ref reader);
            if (!doc.RootElement.TryGetProperty(IndexKey, out var indexElement) ||
                !indexElement.TryGetInt32(out var index) ||
                index is < 0 or > 7)
            {
                throw new JsonException("Cannot not find type index or type index is not a valid number");
            }

            var oneOfBase = CreateOneOf(options, index, doc, OneOfType, Types);

            return (OneOfBase<T0, T1, T2, T3, T4, T5, T6, T7>)Activator.CreateInstance(typeToConvert, oneOfBase);
        }

        public override void Write(Utf8JsonWriter writer,
                                   OneOfBase<T0, T1, T2, T3, T4, T5, T6, T7> value,
                                   JsonSerializerOptions options)
        {
            writer.WriteStartObject();

            writer.WritePropertyName(IndexKey);
            writer.WriteNumberValue(value.Index);

            using var doc = value.Match(
              t0 => JsonSerializer.SerializeToDocument(t0, typeof(T0), options),
              t1 => JsonSerializer.SerializeToDocument(t1, typeof(T1), options),
              t2 => JsonSerializer.SerializeToDocument(t2, typeof(T2), options),
              t3 => JsonSerializer.SerializeToDocument(t3, typeof(T3), options),
              t4 => JsonSerializer.SerializeToDocument(t4, typeof(T4), options),
              t5 => JsonSerializer.SerializeToDocument(t5, typeof(T5), options),
              t6 => JsonSerializer.SerializeToDocument(t6, typeof(T6), options),
              t7 => JsonSerializer.SerializeToDocument(t7, typeof(T7), options)
            );

            foreach (var prop in doc.RootElement.EnumerateObject())
            {
                prop.WriteTo(writer);
            }

            writer.WriteEndObject();
        }
    }

    class OneOf9JsonConverter<T0, T1, T2, T3, T4, T5, T6, T7, T8> : JsonConverter<OneOfBase<T0, T1, T2, T3, T4, T5, T6, T7, T8>>
    {
        static readonly Type OneOfType = typeof(OneOf<,,,,,,,,>).MakeGenericType(typeof(T0), typeof(T1), typeof(T2), typeof(T3), typeof(T4), typeof(T5), typeof(T6), typeof(T7), typeof(T8));
        static readonly Type[] Types = { typeof(T0), typeof(T1), typeof(T2), typeof(T3), typeof(T4), typeof(T5), typeof(T6), typeof(T7), typeof(T8) };

        public OneOf9JsonConverter(JsonSerializerOptions _)
        {
        }

        public override OneOfBase<T0, T1, T2, T3, T4, T5, T6, T7, T8> Read(ref Utf8JsonReader reader,
                                                                             Type typeToConvert,
                                                                             JsonSerializerOptions options)
        {
            using var doc = JsonDocument.ParseValue(ref reader);
            if (!doc.RootElement.TryGetProperty(IndexKey, out var indexElement) ||
                !indexElement.TryGetInt32(out var index) ||
                index is < 0 or > 8)
            {
                throw new JsonException("Cannot not find type index or type index is not a valid number");
            }

            var oneOfBase = CreateOneOf(options, index, doc, OneOfType, Types);

            return (OneOfBase<T0, T1, T2, T3, T4, T5, T6, T7, T8>)Activator.CreateInstance(typeToConvert, oneOfBase);
        }

        public override void Write(Utf8JsonWriter writer,
                                   OneOfBase<T0, T1, T2, T3, T4, T5, T6, T7, T8> value,
                                   JsonSerializerOptions options)
        {
            writer.WriteStartObject();

            writer.WritePropertyName(IndexKey);
            writer.WriteNumberValue(value.Index);

            using var doc = value.Match(
              t0 => JsonSerializer.SerializeToDocument(t0, typeof(T0), options),
              t1 => JsonSerializer.SerializeToDocument(t1, typeof(T1), options),
              t2 => JsonSerializer.SerializeToDocument(t2, typeof(T2), options),
              t3 => JsonSerializer.SerializeToDocument(t3, typeof(T3), options),
              t4 => JsonSerializer.SerializeToDocument(t4, typeof(T4), options),
              t5 => JsonSerializer.SerializeToDocument(t5, typeof(T5), options),
              t6 => JsonSerializer.SerializeToDocument(t6, typeof(T6), options),
              t7 => JsonSerializer.SerializeToDocument(t7, typeof(T7), options),
              t8 => JsonSerializer.SerializeToDocument(t8, typeof(T8), options)
            );

            foreach (var prop in doc.RootElement.EnumerateObject())
            {
                prop.WriteTo(writer);
            }

            writer.WriteEndObject();
        }
    }

}
