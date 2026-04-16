import { useState } from "react";
import { products } from "../data/products";
import ProductCard from "../components/ProductCard";

const Products = () => {
  const [cart, setCart] = useState([]);

  const addToCart = (item) => {
    setCart([...cart, item]);
    alert(`${item.name} added to cart`);
  };

  return (
    <div className="container">
      <h2>Products</h2>

      <div className="grid">
        {products.map((product) => (
          <ProductCard
            key={product.id}
            product={product}
            addToCart={addToCart}
          />
        ))}
      </div>
    </div>
  );
};

export default Products;