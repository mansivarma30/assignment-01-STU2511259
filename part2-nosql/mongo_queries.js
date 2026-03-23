// Use the product catalog collection
use("product_catalog");

// OP1: insertMany() — insert all 3 documents from sample_documents.json
db.products.insertMany([
  {
    _id: "ELEC1001",
    category: "Electronics",
    name: "Samsung 55-inch Smart TV",
    brand: "Samsung",
    price: 54999,
    warranty_years: 2,
    specifications: {
      resolution: "4K",
      voltage: "220-240V",
      screen_type: "LED"
    },
    connectivity: ["HDMI", "USB", "WiFi", "Bluetooth"],
    stock: 25
  },
  {
    _id: "CLOT2001",
    category: "Clothing",
    name: "Men's Cotton T-Shirt",
    brand: "H&M",
    price: 999,
    sizes_available: ["S", "M", "L", "XL"],
    colors: ["Black", "White", "Blue"],
    material: {
      fabric: "Cotton",
      wash_care: "Machine wash"
    },
    gender: "Men",
    stock: 150
  },
  {
    _id: "GROC3001",
    category: "Groceries",
    name: "Organic Almond Milk",
    brand: "Alpro",
    price: 299,
    expiry_date: "2024-12-15",
    nutritional_info: {
      calories_per_100ml: 24,
      fat: "1.1g",
      protein: "0.6g",
      sugar: "0g"
    },
    is_vegan: true,
    stock: 80
  }
]);

// OP2: find() — retrieve all Electronics products with price > 20000
db.products.find({
  category: "Electronics",
  price: { $gt: 20000 }
});

// OP3: find() — retrieve all Groceries expiring before 2025-01-01
db.products.find({
  category: "Groceries",
  expiry_date: { $lt: "2025-01-01" }
});

// OP4: updateOne() — add a "discount_percent" field to a specific product
db.products.updateOne(
  { _id: "ELEC1001" },
  { $set: { discount_percent: 10 } }
);

// OP5: createIndex() — create an index on category field
db.products.createIndex({ category: 1 });

/*
Explanation:
Indexing the 'category' field improves query performance for frequent
filtering operations (e.g., Electronics, Groceries). This is especially
important in large product catalogs where category-based searches are common.
*/
