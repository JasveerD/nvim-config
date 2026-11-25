if exists("b:current_syntax")
  finish
endif

syn case match

" Comments
syn match llvmComment /;.*$/

" String literals
syn region llvmString start=/"/ skip=/\\"/ end=/"/

" Integer and float constants
syn match llvmNumber /\<-\?\d\+\>/
syn match llvmFloat /\<-\?\d\+\.\d*\([eE][+-]\?\d\+\)\?\>/
syn match llvmNumber /\<0x[0-9A-Fa-f]\+\>/
syn keyword llvmBoolean true false
syn keyword llvmConstant null none undef poison zeroinitializer blockaddress

" Types
syn keyword llvmType void i1 i8 i16 i32 i64 i128 half bfloat float double
syn keyword llvmType x86_fp80 fp128 ppc_fp128 x86_mmx x86_amx label metadata
syn keyword llvmType token ptr opaque
syn match llvmType /\<i\d\+\>/

" Identifiers
syn match llvmGlobal /@[-a-zA-Z$._][-a-zA-Z$._0-9]*/
syn match llvmGlobal /@\d\+/
syn match llvmGlobal /@"[^"]*"/
syn match llvmLocal /%[-a-zA-Z$._][-a-zA-Z$._0-9]*/
syn match llvmLocal /%\d\+/
syn match llvmLocal /%"[^"]*"/
syn match llvmLabel /[-a-zA-Z$._0-9]\+:/

" Metadata and attributes
syn match llvmMetadata /!\d\+/
syn match llvmMetadata /![-a-zA-Z$._][-a-zA-Z$._0-9]*/
syn match llvmAttribute /#\d\+/

" Terminator instructions
syn keyword llvmStatement ret br switch indirectbr invoke callbr resume
syn keyword llvmStatement unreachable cleanupret catchswitch catchret

" Unary operators
syn keyword llvmStatement fneg

" Binary operators
syn keyword llvmStatement add fadd sub fsub mul fmul udiv sdiv fdiv
syn keyword llvmStatement urem srem frem

" Bitwise operators
syn keyword llvmStatement shl lshr ashr and or xor

" Memory instructions
syn keyword llvmStatement alloca load store fence cmpxchg atomicrmw
syn keyword llvmStatement getelementptr

" Conversion instructions
syn keyword llvmStatement trunc zext sext fptrunc fpext fptoui fptosi
syn keyword llvmStatement uitofp sitofp ptrtoint inttoptr bitcast addrspacecast

" Other instructions
syn keyword llvmStatement icmp fcmp phi select call va_arg
syn keyword llvmStatement landingpad catchpad cleanuppad
syn keyword llvmStatement freeze

" Vector instructions
syn keyword llvmStatement extractelement insertelement shufflevector

" Aggregate instructions
syn keyword llvmStatement extractvalue insertvalue

" Keywords
syn keyword llvmKeyword define declare global constant external internal
syn keyword llvmKeyword private linkonce linkonce_odr weak weak_odr appending
syn keyword llvmKeyword common available_externally dllimport dllexport
syn keyword llvmKeyword hidden protected default
syn keyword llvmKeyword thread_local unnamed_addr local_unnamed_addr
syn keyword llvmKeyword externally_initialized
syn keyword llvmKeyword type opaque align
syn keyword llvmKeyword addrspace section comdat
syn keyword llvmKeyword attributes target datalayout triple
syn keyword llvmKeyword source_filename module asm
syn keyword llvmKeyword tail musttail notail
syn keyword llvmKeyword nuw nsw exact inbounds
syn keyword llvmKeyword volatile atomic unordered monotonic acquire release
syn keyword llvmKeyword acq_rel seq_cst syncscope
syn keyword llvmKeyword personality to unwind cleanup catch filter
syn keyword llvmKeyword nnan ninf nsz arcp contract afn reassoc fast
syn keyword llvmKeyword eq ne ugt uge ult ule sgt sge slt sle
syn keyword llvmKeyword oeq ogt oge olt ole one ord ueq une uno
syn keyword llvmKeyword nonnull dereferenceable noundef signext zeroext
syn keyword llvmKeyword inreg byval sret noalias nocapture nofree
syn keyword llvmKeyword nest returned swiftself swiftasync swifterror
syn keyword llvmKeyword immarg noundef byref elementtype preallocated
syn keyword llvmKeyword alwaysinline cold convergent inaccessiblememonly
syn keyword llvmKeyword inaccessiblemem_or_argmemonly inlinehint minsize
syn keyword llvmKeyword naked noinline nobuiltin noduplicate noimplicitfloat
syn keyword llvmKeyword nomerge noredzone noreturn nounwind optsize
syn keyword llvmKeyword readnone readonly returns_twice speculatable
syn keyword llvmKeyword ssp sspreq sspstrong strictfp uwtable willreturn
syn keyword llvmKeyword writeonly argmemonly mustprogress nosync noprofile
syn keyword llvmKeyword safestack sanitize_address sanitize_memory
syn keyword llvmKeyword sanitize_thread memory

" Intrinsic prefixes
syn match llvmIntrinsic /@llvm\.[a-zA-Z._0-9]*/

" Comdat
syn keyword llvmKeyword any exactmatch largest noduplicates samesize

" Highlight links
hi def link llvmComment Comment
hi def link llvmString String
hi def link llvmNumber Number
hi def link llvmFloat Float
hi def link llvmBoolean Boolean
hi def link llvmConstant Constant
hi def link llvmType Type
hi def link llvmGlobal Identifier
hi def link llvmLocal Identifier
hi def link llvmLabel Label
hi def link llvmMetadata Special
hi def link llvmAttribute PreProc
hi def link llvmStatement Statement
hi def link llvmKeyword Keyword
hi def link llvmIntrinsic Function

let b:current_syntax = "llvm"
