const ProductCard = ({ product, addToCart }) => {
  const { name, category, price, stock, image } = product;

  return (
    <div className={`card ${stock < 5 ? "low-stock" : ""}`}>
      <img src={image} alt={name} />

      <h3>{name}</h3>
      <p>Category: {category}</p>
      <p>Price: ₹{price}</p>
      <p>Stock: {stock}</p>

      {/* Status */}
      <p className={stock === 0 ? "out" : "in"}>
        {stock === 0 ? "Out of Stock" : "In Stock"}
      </p>

      {/* Conditional text */}
      {stock > 0 && stock < 5 && (
        <p className="warning">Hurry! Only few left</p>
      )}

      {/* Button */}
      <button
        disabled={stock === 0}
        onClick={() => addToCart(product)}
      >
        Add to Cart
      </button>
    </div>
  );
};

export default ProductCard;