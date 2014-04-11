-- ----------------------------------------------------------------- [ Key.idr ]
-- Module      : Keys
-- Description : Types Cryptographic Keys MkII
-- Copyright   : (c) Jan de Muijnck-Hughes
-- License     : see LICENSE
-- --------------------------------------------------------------------- [ EOH ]
module Crypto.Adv.Key

import Crypto.Common

--- Question is do I paramiterise over a Key Type...

data Key : ( vis : Visibility) -> (setting : s ) -> Type where
  MkEncKey    : a -> (setting : s) -> (value : v ) -> Key Public s
  MkDecKey    : a -> (setting : s) -> (value : v ) -> Key Private s
  MkSignKey   : a -> (setting : s) -> (value : v ) -> Key Private s
  MkVerifyKey : a -> (setting : s) -> (value : v ) -> Key Public s

