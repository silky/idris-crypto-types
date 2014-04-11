-- -------------------------------------------------------------- [ Common.idr ]
-- Module      : Common
-- Description : Common things for advanced crypto
-- Copyright   : (c) Jan de Muijnck-Hughes
-- License     : see LICENSE
-- --------------------------------------------------------------------- [ EOF ]
module Crypto.Adv.Common

namespace BPolicy
    data BPolicy : Type where
      Leaf : (value : a) -> BPolicy
      Or   : (l : BPolicy) -> (r : BPolicy) -> BPolicy
      And  : (l : BPolicy) -> (r : BPolicy) -> BPolicy

namespace TPolicy
  data TPolicy : (threshold : Nat) -> (count : Nat) -> Type where
    TLeaf      : (value : a) -> TPolicy 1 1
    NKPolicy   : (k : Nat) -> (children : Vect n (TPolicy t m)) -> TPolicy k n
    OneKPolicy : (children : Vect n (TPolicy t m)) -> TPolicy 1 n
    KKPolicy   : (children : Vect n (TPolicy t m)) -> TPolicy n n
    
foobar : BPolicy 
foobar = Or (And
              (Or (Leaf "a:xxx0") (Leaf "a:xx0x"))
              (Leaf "a:x0xx"))
            (Leaf "a:0xxx")

foobar' : TPolicy 1 2
foobar' = OneKPolicy [KKPolicy
                      [OneKPolicy
                          [TLeaf "a:xx0", TLeaf "a:xx0x"],
                       TLeaf "a:x0xx"],
                      TLeaf "a:0xxx"]
-- 1of2 ( 2of2 ( 1of2 ( a:xxx0 , a:xx0x ) , a:x0xx ) , a:0xxx )
