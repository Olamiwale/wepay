import { BrowserRouter, Routes, Route } from "react-router-dom";
import Home from "./pages/Home";
import Transaction from "./pages/transaction";
import Account from "./pages/account";




function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/transaction" element={<Transaction />} />
        <Route path="/account" element={<Account />} />
      </Routes>
    </BrowserRouter>
  );
}

export default App;
