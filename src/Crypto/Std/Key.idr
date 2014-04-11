-- ----------------------------------------------------------------- [ Key.idr ]
-- Module      : Keys
-- Description : Types for Cryptographic Keys
-- Copyright   : (c) Jan de Muijnck-Hughes
-- License     : see LICENSE
-- --------------------------------------------------------------------- [ EOH ]
module Crypto.Std.Key

import Crypto.Common
import Data.Bits

||| Keys are vectors of bits.
||| 
||| @ v The Visibility of the key with respect to the owner.
||| @ s The setting in which the key is to be used.
||| @ l The length of the key in bits.
data Key : (v : Visibility) -> (s : Setting) -> (l : Nat) -> Type where
  ||| PKE Encryption keys.
  MkEncKey : Bits n -> Key Public Asymm n

  ||| PKE Decryption keys
  MkDecKey : Bits n -> Key Private Asymm n

  ||| DS Signing keys.
  MkSignKey : Bits n -> Key Private Sign n

  ||| DS Verifying keys.
  MkVerifyKey : Bits n -> Key Public Sign n

  ||| Symmetric keys 
  MkSymmKey : Bits n -> Key Private Symm n

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


data TDESKeyOption = KeyOption1 | KeyOption2 | KeyOption3

||| Representation of a Triple DES
|||
||| @ s The setting in ehich the key is to be used.
||| @ n The length of each key
||| @ option The Keying option used.
data TDESKey : (s : Setting) -> (n : Nat) -> (option : TDESKeyOption)-> Type where
  ||| 
  MkTDESKey : (key1 : Bits n)
             -> (key2 : Bits n)
             -> (key3 : Bits n)
             -> (opt : TDESKeyOption)
             -> TDESKey Symm n opt
-- --------------------------------------------------------------------- [ EOF ]
