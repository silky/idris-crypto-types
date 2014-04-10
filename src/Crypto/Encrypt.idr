-- ------------------------------------------------------------- [ Encrypt.idr ]
-- Module      : Encrypt
-- Description : Classes for Encryption operations.
-- Copyright   : (c) Jan de Muijnck-Hughes
-- License     : see LICENSE
-- --------------------------------------------------------------------- [ EOH ]
module Crypto.Encrypt

import Crypto.Common
import Crypto.Key
import Crypto.Nonce
import Crypto.Messages

||| Description of a Authenticated PKE Scheme.
||| 
class AuthPKEncScheme s where
  ||| Generate Public Private Key Pair.
  apkeKeyGen  : (Key Public Asymm n, Key Private Asymm m)

  ||| Encrypt a message.
  ||| 
  ||| @ n The Nonce 
  ||| @ recvenc The receiver's public key.
  ||| @ senddec The sender's private key.
  ||| @ msg The plainttext to be encrypted.
  apkeEncrypt : (n : Nonce Asymm Random a)
               -> (recvenc : Key Public Asymm b)
               -> (senddec : Key Private Asymm c)
               -> (msg : Message d)
               -> Maybe (Encrypted e)

  ||| Decrypted a ciphertext.
  ||| 
  ||| @ n The nonce.
  ||| @ sendenc The sender's public key.
  ||| @ recvdec The receiver's private key.
  ||| @ ctxt The ciphertext to be decrypted.
  apkeDecrypt : (n : Nonce Asymm Random a)
               -> (sendenc : Key Public Asymm c)
               -> (recvdec : Key Private Asymm b)
               -> (ctxt : Encrypted e)
               -> Maybe (Message d)

||| Description of an Symmetric Encryption Scheme.
||| 
class SymmScheme s where
  ||| Generate a symmetric key.
  symmKeyGen  : (Key Private Symm n)

  ||| Encrypt a msg.
  ||| 
  ||| @ n The nonce.
  ||| @ k The secret key.
  ||| @ msg The plaintext to be encrypted.
  symmEncrypt : (n : Nonce Symm Random a)
                -> (k : Key Private Symm b)
                -> (msg : Message c)
                -> Maybe (Encrypted d)

  ||| Decrypt a ciphertext
  ||| 
  ||| @ n The nonce
  ||| @ k The secret key.
  ||| @ ctxt The ciphertext to be decrypted.
  symmDecrypt : (n : Nonce Symm Random a)
                -> (k : Key Private Symm b)
                -> (ctxt : Encrypted d)
                -> Maybe (Message c)
               
-- --------------------------------------------------------------------- [ EOF ]
