-- --------------------------------------------------------------- [ Nonce.idr ]
-- Module      : Nonce
-- Description : Types for Nonces
-- Copyright   : (c) Jan de Muijnck-Hughes
-- License     : see LICENSE
-- --------------------------------------------------------------------- [ EOH ]
module Crypto.Nonce

import Crypto.Common

data TyNonce = Zero | Random

||| Nonces for guaranteeing freshness.
||| 
||| @ s The setting.
||| @ tyN The nonce type.
||| @ l The length.
data Nonce : (s : Setting) -> (tyN : TyNonce) -> (l : Nat) -> Type where
  ||| The all zero nonce for asymmetric encryption.
  MkZeroPkNonce : Vect n a -> Nonce Asymm Zero n
  ||| A randomly generated nonce for asymmetric encryption.
  MkRndPkNonce  : Vect n a -> Nonce Asymm Random n

  ||| The all zero nonce for symmetric encryption.
  MkZeroSkNonce : Vect n a -> Nonce Symm Zero n
  ||| A randomly generated nonce for symmetric encryption.
  MkRndSkNonce  : Vect n a -> Nonce Symm Random n


-- --------------------------------------------------------------------- [ EOF ]
