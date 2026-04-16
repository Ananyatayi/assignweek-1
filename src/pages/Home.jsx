import { Link } from "react-router-dom";
import { products } from "../data/products";

const Home = () => {
  return (
    <div className="home">

      {/* HERO SECTION */}
      <div className="hero">
        <h1>Welcome to ShopKart 🛒</h1>
        <p>Your one-stop shop for all essentials</p>
        <Link to="/products">
          <button className="shop-btn">Shop Now</button>
        </Link>
      </div>

      {/* FEATURED PRODUCTS */}
      <div className="featured">
        <h2>Featured Products</h2>

        <div className="grid">
          {products.slice(0, 3).map((item) => (
            <div key={item.id} className="card">
              <img src={item.image} alt={item.name} />
              <h3>{item.name}</h3>
              <p>₹{item.price}</p>
            </div>
          ))}
        </div>
      </div>

    </div>
  );
};

export default Home;