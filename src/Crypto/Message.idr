-- ------------------------------------------------------------ [ Messages.idr ]
-- Module      : Messages
-- Description : Types for Crypto Messages
-- Copyright   : (c) Jan de Muijnck-Hughes
-- License     : see LICENSE
-- --------------------------------------------------------------------- [ EOH ]
module Crypto.Message

||| Representation if Messages
data Message : Nat -> Type where
  MkMsgData : Vect n Bits32 -> Message n

||| Representation of a ciphertext.
data Encrypted : Nat -> Type where
  MkEncData : Vect n Bits32 -> Encrypted n

||| Representation of a digital signature.
data Signed : Nat -> Type where
  MkSigData : Vect n Bits32 -> Signed n

-- --------------------------------------------------------------------- [ EOF ]
