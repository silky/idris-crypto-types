-- ----------------------------------------------------------------- [ Key.idr ]
-- Module      : Keys
-- Description : Types for Cryptographic Keys
-- Copyright   : (c) Jan de Muijnck-Hughes
-- License     : see LICENSE
-- --------------------------------------------------------------------- [ EOH ]
module Crypto.Key

import Crypto.Common

||| Keys are vectors of bits.
||| 
||| @ v The Visibility of the key with respect to the owner.
||| @ s The setting in which the key is to be used.
||| @ l The length of the key in bits.
data Key : (v : Visibility) -> (s : Setting) -> (l : Nat) -> Type where
  ||| PKE Encryption keys.
  MkEncKey : (Vect n a) -> Key Public Asymm n

  ||| PKE Decryption keys
  MkDecKey : (Vect n a) -> Key Private Asymm n

  ||| DS Signing keys.
  MkSignKey : (Vect n a) -> Key Private Sign n

  ||| DS Verifying keys.
  MkVerifyKey : (Vect n a) -> Key Public Sign n

  ||| Symmetric keys 
  MkSymmKey : (Vect n a) -> Key Private Symm n


||| Key pairs
||| 
||| @ s The setting in which the key is to be used.
||| @ l The length of the key in bits.
data KeyPair : (s : Setting) -> (l : Nat) -> Type where
  ||| Key pair for PKE.
  ||| 
  ||| @ pub The public key.
  ||| @ priv The private key.
  MkAsymmKeyPair : (pub : Key Public Asymm n)
                 -> (priv : Key Private Asymm n)
                 -> KeyPair Asymm n

  ||| Key pair for DS.
  ||| 
  ||| @ sig The signing key.
  ||| @ ver The verifying key.
  MkSignKeyPair : (sig : Key Private Sign n)
                -> (ver : Key Public Sign n)
                -> KeyPair Sign n

-- --------------------------------------------------------------------- [ EOF ]
