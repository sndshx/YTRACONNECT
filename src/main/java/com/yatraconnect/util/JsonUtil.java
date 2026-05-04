package com.yatraconnect.util;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import java.lang.reflect.Type;
import java.util.List;

public class JsonUtil {
    private static final Gson gson = new GsonBuilder()
            .setPrettyPrinting()
            .create();

    private static final Gson gsonCompact = new Gson();

    /**
     * Convert object to JSON string
     * @param object The object to convert
     * @return JSON string
     */
    public static String toJson(Object object) {
        return gson.toJson(object);
    }

    /**
     * Convert object to compact JSON string (no pretty printing)
     * @param object The object to convert
     * @return Compact JSON string
     */
    public static String toJsonCompact(Object object) {
        return gsonCompact.toJson(object);
    }

    /**
     * Convert JSON string to object
     * @param json The JSON string
     * @param classOfT The class of the object
     * @param <T> The type of the object
     * @return The converted object
     */
    public static <T> T fromJson(String json, Class<T> classOfT) {
        return gson.fromJson(json, classOfT);
    }

    /**
     * Convert JSON string to object with type
     * @param json The JSON string
     * @param type The type of the object
     * @param <T> The type of the object
     * @return The converted object
     */
    public static <T> T fromJson(String json, Type type) {
        return gson.fromJson(json, type);
    }

    /**
     * Convert list to JSON string
     * @param list The list to convert
     * @return JSON string
     */
    public static String listToJson(List<?> list) {
        return gson.toJson(list);
    }

    /**
     * Convert JSON string to list
     * @param json The JSON string
     * @param type The type of the list elements
     * @param <T> The type of the list elements
     * @return The converted list
     */
    public static <T> List<T> jsonToList(String json, Type type) {
        return gson.fromJson(json, type);
    }

    /**
     * Parse JSON string to JsonObject
     * @param json The JSON string
     * @return JsonObject
     */
    public static JsonObject parseJsonObject(String json) {
        return JsonParser.parseString(json).getAsJsonObject();
    }

    /**
     * Parse JSON string to JsonArray
     * @param json The JSON string
     * @return JsonArray
     */
    public static JsonArray parseJsonArray(String json) {
        return JsonParser.parseString(json).getAsJsonArray();
    }

    /**
     * Check if JSON string is valid
     * @param json The JSON string to validate
     * @return true if valid JSON, false otherwise
     */
    public static boolean isValidJson(String json) {
        try {
            JsonParser.parseString(json);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    /**
     * Create a success response JSON
     * @param message The success message
     * @return JSON string
     */
    public static String successResponse(String message) {
        JsonObject response = new JsonObject();
        response.addProperty("success", true);
        response.addProperty("message", message);
        return gson.toJson(response);
    }

    /**
     * Create an error response JSON
     * @param message The error message
     * @return JSON string
     */
    public static String errorResponse(String message) {
        JsonObject response = new JsonObject();
        response.addProperty("success", false);
        response.addProperty("error", message);
        return gson.toJson(response);
    }

    /**
     * Create a success response JSON with data
     * @param message The success message
     * @param data The data object
     * @return JSON string
     */
    public static String successResponseWithData(String message, Object data) {
        JsonObject response = new JsonObject();
        response.addProperty("success", true);
        response.addProperty("message", message);
        response.add("data", gson.toJsonTree(data));
        return gson.toJson(response);
    }
}