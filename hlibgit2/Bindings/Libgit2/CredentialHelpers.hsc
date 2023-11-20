{-# OPTIONS_GHC -fno-warn-unused-imports #-}
#include <bindings.dsl.h>
#include "../../libgit2/build/include/git2/credential_helpers.h"
module Bindings.Libgit2.CredentialHelpers where
import Foreign.Ptr
#strict_import

import Bindings.Libgit2.Transport
{- typedef struct git_credential_userpass_payload {
            const char * username; const char * password;
        } git_credential_userpass_payload; -}
#starttype struct git_credential_userpass_payload
#field username , CString
#field password , CString
#stoptype
#synonym_t git_credential_userpass_payload , <struct git_credential_userpass_payload>
#ccall git_credential_userpass , Ptr (Ptr <struct git_credential>) -> CString -> CString -> CUInt -> Ptr () -> IO CInt
