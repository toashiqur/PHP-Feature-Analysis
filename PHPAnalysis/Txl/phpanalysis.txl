include "php.grm"

function main
    match [program] 
	PHPProgram [program]

    % Name of php File
    import TXLinput [stringlit]
    construct _ [stringlit]
	TXLinput [putp "php file: %"]

    % Size of whole php file
    construct EOLs [newline*]
	_ [^ PHPProgram]
    construct _ [number]
	_ [length EOLs] [putp "lines: %"]
	
	
	%============== Class and objects ==========================
	%-------- How many classes----	
    construct ClassDecls [ClassDecl*]
	_ [^ PHPProgram]
    construct _ [number]
 	_ [length ClassDecls] [putp "ClassDecl: %"]
	
	%-------- How many interfaces----	
    construct InterfaceDecls [InterfaceDecl*]
	_ [^ PHPProgram]
    construct _ [number]
 	_ [length InterfaceDecls] [putp "InterfaceDecl: %"]
	
	%-------- How many namespaces---supports multiple in one file-	
    construct NamespaceDecls [NamespaceDecl*]
	_ [^ PHPProgram]
    construct _ [number]
 	_ [length NamespaceDecls] [putp "NamespaceDecl: %"]
	
	
	%============== Magical methods are OOP concept (page76)=========
	%============== Get Magical methods ==========================
	%-------- How many functions----	
    construct FunctionDecls [FunctionDecl*]
	_ [^ PHPProgram]
    construct _ [number]
 	_ [length FunctionDecls] [putp "FunctionDecl: %"]
	
	%..... Find Special functions ....
	%Find __construct() Declarations
	construct FunctionConstructDecls[FunctionDecl*]
	_ [getConstructDecls  each FunctionDecls]
	construct _ [number]
	_ [length FunctionConstructDecls] [putp "ConstructDecl: %"]
	
	%Find __destruct() Declarations
	construct FunctionDestructDecls[FunctionDecl*]
	_ [getDestructDecls  each FunctionDecls]
	construct _ [number]
	_ [length FunctionDestructDecls] [putp "Destruct()Decl: %"]

	%Find __call() Declarations
	construct FunctionCallDecls[FunctionDecl*]
	_ [getCallDecls  each FunctionDecls]
	construct _ [number]
	_ [length FunctionCallDecls] [putp "Call(): %"]
	
	%Find __callstatic() Declarations
	construct FunctionCallStaticDecls[FunctionDecl*]
	_ [getCallStaticDecls  each FunctionDecls]
	construct _ [number]
	_ [length FunctionCallStaticDecls] [putp "CallStatic(): %"]
	
	%Find __get() Declarations
	construct FunctionGetDecls[FunctionDecl*]
	_ [getGetDecls  each FunctionDecls]
	construct _ [number]
	_ [length FunctionGetDecls] [putp "Get(): %"]

	%Find __set() Declarations
	construct FunctionSetDecls[FunctionDecl*]
	_ [getSetDecls  each FunctionDecls]
	construct _ [number]
	_ [length FunctionSetDecls] [putp "Set(): %"]

	%Find __isset() Declarations
	construct FunctionIssetDecls[FunctionDecl*]
	_ [getIssetDecls  each FunctionDecls]
	construct _ [number]
	_ [length FunctionIssetDecls] [putp "isset(): %"]

	%Find __unset() Declarations
	construct FunctionUnsetDecls[FunctionDecl*]
	_ [getUnsetDecls  each FunctionDecls]
	construct _ [number]
	_ [length FunctionUnsetDecls] [putp "Unset(): %"]
	
	%Find __sleep() Declarations
	construct FunctionSleepDecls[FunctionDecl*]
	_ [getSleepDecls  each FunctionDecls]
	construct _ [number]
	_ [length FunctionSleepDecls] [putp "Sleep(): %"]
	
	%Find __wakeup() Declarations
	construct FunctionWakeUpDecls[FunctionDecl*]
	_ [getWakeUpDecls  each FunctionDecls]
	construct _ [number]
	_ [length FunctionWakeUpDecls] [putp "WakeUp(): %"]
	
	%Find __tostring() Declarations
	construct FunctionToStringDecls[FunctionDecl*]
	_ [getToStringDecls  each FunctionDecls]
	construct _ [number]
	_ [length FunctionToStringDecls] [putp "toString(): %"]	
	
	%Find __invoke() Declarations
	construct FunctionInvokeDecls[FunctionDecl*]
	_ [getInvokeDecls  each FunctionDecls]
	construct _ [number]
	_ [length FunctionInvokeDecls] [putp "invoke(): %"]
	
	%Find __set_state() Declarations
	construct FunctionSetStateDecls[FunctionDecl*]
	_ [getSetStateDecls  each FunctionDecls]
	construct _ [number]
	_ [length FunctionSetStateDecls] [putp "setstate(): %"]
	
	%Find __clone() Declarations
	construct FunctionCloneDecls[FunctionDecl*]
	_ [getCloneDecls  each FunctionDecls]
	construct _ [number]
	_ [length FunctionCloneDecls] [putp "clone(): %"]
	
	%Find __clone() Declarations
	construct FunctionAutoLoadDecls[FunctionDecl*]
	_ [getAutoLoadDecls  each FunctionDecls]
	construct _ [number]
	_ [length FunctionAutoLoadDecls] [putp "AutoLoad(): %"]
	
	%Find __debugInfo() Declarations
	construct FunctionDebugInfoDecls[FunctionDecl*]
	_ [getDebugInfoDecls  each FunctionDecls]
	construct _ [number]
	_ [length FunctionDebugInfoDecls] [putp "debugInfo(): %"]
	
%=============== Find Classes ===========================
	
	%===================================================
	
	%=================if statements=======
    construct IfStatements [IfStatement*]
	_ [^ PHPProgram]
    construct _ [number]
 	_ [length IfStatements] [putp "ifStatement: %"]
	
	
    construct IfStmtsWithColon [IfStatement*]
	_ [getIfStmtsWithColon each IfStatements]
    construct _ [number]
 	_ [length IfStmtsWithColon] [putp "ifWithColon: %"]
	
    construct IfStmtsWithoutColon [IfStatement*]
	_ [getIfStmtsWithoutColon each IfStatements]
    construct _ [number]
 	_ [length IfStmtsWithoutColon] [putp "ifWithoutColon: %"]



	%=================While statements=======
    construct WhileStatements [WhileStatement*]
	_ [^ PHPProgram]
    construct _ [number]
 	_ [length WhileStatements] [putp "whileStatement: %"]
	
	
    construct WhileWithColon [WhileStatement*]
	_ [getWhileWithColon each WhileStatements]
    construct _ [number]
 	_ [length WhileWithColon] [putp "whileWithColon: %"]
	
    construct WhileWithoutColon [WhileStatement*]
	_ [getWhileWithoutColon each WhileStatements]
    construct _ [number]
 	_ [length WhileWithoutColon] [putp "whileWithoutColon: %"]

	
	%=================================
	
	
	%================= For statements=======
    construct ForStatements [ForStatement*]
	_ [^ PHPProgram]
    construct _ [number]
 	_ [length ForStatements] [putp "forStatement: %"]
	
	
    construct ForWithColon [ForStatement*]
	_ [getForWithColon each ForStatements]
    construct _ [number]
 	_ [length ForWithColon] [putp "forWithColon: %"]
	
    construct ForWithoutColon [ForStatement*]
	_ [getForWithoutColon each ForStatements]
    construct _ [number]
 	_ [length ForWithoutColon] [putp "forWithoutColon: %"]

	
	%=================================
	
	%================= Switch statements=======
    construct SwitchStatements [SwitchStatement*]
	_ [^ PHPProgram]
    construct _ [number]
 	_ [length SwitchStatements] [putp "switchStatement: %"]
	
	
    construct SwitchWithColon [SwitchStatement*]
	_ [getSwitchWithColon each SwitchStatements]
    construct _ [number]
 	_ [length SwitchWithColon] [putp "switchWithColon: %"]
	
    construct SwitchWithoutColon [SwitchStatement*]
	_ [getSwitchWithoutColon each SwitchStatements]
    construct _ [number]
 	_ [length SwitchWithoutColon] [putp "switchWithoutColon: %"]

	
	%=================================	
	%================= Switch statements=======
    construct ForEachStatements [ForEachStatement*]
	_ [^ PHPProgram]
    construct _ [number]
 	_ [length ForEachStatements] [putp "forEachStatement: %"]
	
	
    construct ForEachWithColon [ForEachStatement*]
	_ [getForEachWithColon each ForEachStatements]
    construct _ [number]
 	_ [length ForEachWithColon] [putp "forEachWithColon: %"]
	
    construct ForEachWithoutColon [ForEachStatement*]
	_ [getForEachWithoutColon each ForEachStatements]
    construct _ [number]
 	_ [length ForEachWithoutColon] [putp "forEachWithoutColon: %"]

	
	%=================================	
	
	
	
	%--do developers use tryStatement to catch error and safety--
	construct TryStatements [TryStatement*]
	_ [^ PHPProgram]
	construct _[number]
	_ [length TryStatements] [putp "TryStatements: %"]

	%--do developers use Unset statement--
	construct UnsetStatements [UnsetStatement*]
	_ [^ PHPProgram]
	construct _[number]
	_ [length UnsetStatements] [putp "unset(): %"]		

	%--do developers use TernaryExpression--
	construct IfConditionalOrExprStatements [IfConditionalOrExpr*]
	_ [^ PHPProgram]
	construct _[number]
	_ [length IfConditionalOrExprStatements] [putp "TernaryExpression: %"]
	

	%==================================================
	% Find MagicConstants __A__
	%===================================================
	construct MagicConstantStatements [MagicConstant*]
	_ [^ PHPProgram]
	construct _[number]
	_ [length MagicConstantStatements] [putp "MagicConstant Statements: %"]	
	
	%Find __FILE__
	construct MagicFileConstant[MagicConstant*]
	_ [getMagicFileConstant  each MagicConstantStatements]
	construct _ [number]
	_ [length MagicFileConstant] [putp "MagicFileConstant: %"]
	
	%Find __Dir__
	construct MagicDirConstant[MagicConstant*]
	_ [getMagicDirConstant  each MagicConstantStatements]
	construct _ [number]
	_ [length MagicDirConstant] [putp "MagicDirConstant: %"]
	
	%Find __Function__
	construct MagicFunctionConstant[MagicConstant*]
	_ [getMagicFunctionConstant  each MagicConstantStatements]
	construct _ [number]
	_ [length MagicFileConstant] [putp "MagicFunctionConstant: %"]
	
	%Find __class__
	construct MagicClassConstant[MagicConstant*]
	_ [getMagicClassConstant  each MagicConstantStatements]
	construct _ [number]
	_ [length MagicClassConstant] [putp "MagicClassConstant: %"]
	
		%Find __Method__
	construct MagicMethodConstant[MagicConstant*]
	_ [getMagicMethodConstant  each MagicConstantStatements]
	construct _ [number]
	_ [length MagicMethodConstant] [putp "MagicMethodConstant: %"]
	
		%Find __Line__
	construct MagicLineConstant[MagicConstant*]
	_ [getMagicLineConstant  each MagicConstantStatements]
	construct _ [number]
	_ [length MagicLineConstant] [putp "MagicLineConstant: %"]
	

	%Find __Namespace__
	construct MagicNameSpaceConstant[MagicConstant*]
	_ [getMagicNameSpaceConstant  each MagicConstantStatements]
	construct _ [number]
	_ [length MagicNameSpaceConstant] [putp "MagicNameSpaceConstant: %"]
	
	

	%--------	
	construct InternalFunctionCalls [InternalFunction*]
	_ [^ PHPProgram]
	construct _ [number]
	_ [length InternalFunctionCalls] [putp "AllInternalFunctionCalls: %"]

	%<<Similar Activities>>
	%Find new calls
	construct FunctionNewCalls[InternalFunction*]
	_ [getNewCalls  each InternalFunctionCalls]
	construct _ [number]
	_ [length FunctionNewCalls] [putp "newCalls: %"]
	%..........	


	%Find clone calls
	construct FunctionCloneCalls[InternalFunction*]
	_ [getCloneCalls  each InternalFunctionCalls]
	construct _ [number]
	_ [length FunctionCloneCalls] [putp "cloneCalls: %"]
	%..........	

	%Find isset calls
	construct FunctionIssetCalls[InternalFunction*]
	_ [getIssetCalls  each InternalFunctionCalls]
	construct _ [number]
	_ [length FunctionIssetCalls] [putp "issetCalls: %"]
	%..........		

	%Find empty calls
	construct FunctionEmptyCalls[InternalFunction*]
	_ [getEmptyCalls  each InternalFunctionCalls]
	construct _ [number]
	_ [length FunctionEmptyCalls] [putp "emptyCalls: %"]
	%..........	

	%Find intval calls
	construct FunctionIntvalCalls[InternalFunction*]
	_ [getIntvalCalls  each InternalFunctionCalls]
	construct _ [number]
	_ [length FunctionIntvalCalls] [putp "intvalCalls: %"]
	%..........	
	
	%Find eval calls
	construct FunctionEvalCalls[InternalFunction*]
	_ [getEvalCalls  each InternalFunctionCalls]
	construct _ [number]
	_ [length FunctionEvalCalls] [putp "evalCalls: %"]
	%---------
	
	%Find exit calls
	construct FunctionExitCalls[InternalFunction*]
	_ [getExitCalls  each InternalFunctionCalls]
	construct _ [number]
	_ [length FunctionExitCalls] [putp "exitCalls: %"]
	%..........	

	%Find include calls
	construct FunctionIncludeCalls[InternalFunction*]
	_ [getIncludeCalls  each InternalFunctionCalls]
	construct _ [number]
	_ [length FunctionIncludeCalls] [putp "includeCalls: %"]
	%..........	

	%Find include_once calls
	construct FunctionIncludeOnceCalls[InternalFunction*]
	_ [getIncludeOnceCalls  each InternalFunctionCalls]
	construct _ [number]
	_ [length FunctionIncludeOnceCalls] [putp "include_onceCalls: %"]
	%..........	

	%Find require calls
	construct FunctionRequireCalls[InternalFunction*]
	_ [getRequireCalls  each InternalFunctionCalls]
	construct _ [number]
	_ [length FunctionRequireCalls] [putp "requireCalls: %"]
	%..........	

	%Find require_once calls
	construct FunctionRequireOnceCalls[InternalFunction*]
	_ [getRequireOnceCalls  each InternalFunctionCalls]
	construct _ [number]
	_ [length FunctionRequireOnceCalls] [putp "require_onceCalls: %"]
	%..........	
	
	%Find use calls
	construct FunctionUseCalls[InternalFunction*]
	_ [getUseCalls  each InternalFunctionCalls]
	construct _ [number]
	_ [length FunctionUseCalls] [putp "useCalls: %"]
	%..........	
	
	%==================================================
	% Find IDs implode explode
	%===================================================	
    construct AllIds [id*]
	_ [^ PHPProgram]
    construct _ [number]
 	_ [length AllIds] [putp "TotalID: %"]
	
	% .....Is the id explode.....
	construct ExplodeCalls[id*]
	_ [getExplodeCall  each AllIds ]
	construct _ [number]
	_ [length ExplodeCalls] [putp "explode()call: %"]
	
	% .....Is the id implode.....
	construct ImplodeCalls[id*]
	_ [getImplodeCall  each AllIds ]
	construct _ [number]
	_ [length ImplodeCalls] [putp "implode()call: %"]
	

	%==================================================
	% Find ScopeResolutionOperator ::
	%===================================================	
    construct ClassNameColonColons [ClassNameColonColon*]
	_ [^ PHPProgram]
    construct _ [number]
 	_ [length ClassNameColonColons] [putp "ScopeResolution: %"]
	
	%==================================================
	% Find StringConstant
	%===================================================	
    construct AllStringConstants [StringConstant*]
	_ [^ PHPProgram]
    construct _ [number]
 	_ [length AllStringConstants] [putp "TotalStringConstants: %"]
	
	%==================================================
	% Find heredoc
	%===================================================	
	construct HeredocOperators[StringConstant*]
	_ [getHeredocOperator  each AllStringConstants ]
	construct _ [number]
	_ [length HeredocOperators] [putp "heredocOperators: %"]
	

	
	%==================================================
	% Find Declare statement
	%===================================================	
    construct DeclareStmts[DeclareStatement*]
	_ [^ PHPProgram]
    construct _ [number]
 	_ [length DeclareStmts] [putp "Declare(): %"]
	
	%==================================================
	% Find use of as
	%===================================================	
    construct AsSimpleVariableNames[AsSimpleVariableName*]
	_ [^ PHPProgram]
    construct _ [number]
 	_ [length AsSimpleVariableNames] [putp "AsSimpleVariableNames: %"]
	

	%==================================================
	% Find use of equality operator
	%===================================================
    construct EqualityOps[EqualityOp*]
	_ [^ PHPProgram]
    construct _ [number]
 	_ [length EqualityOps] [putp "EqualityOps: %"]
	
	%....Find == ......
	construct DoubleEquals[EqualityOp*]
	_ [getDoubleEqual  each EqualityOps ]
	construct _ [number]
	_ [length DoubleEquals] [putp "DoubleEquals: %"]
	
	%....Find === ......
	construct TripleEquals[EqualityOp*]
	_ [getTripleEqual  each EqualityOps ]
	construct _ [number]
	_ [length TripleEquals] [putp "Identical: %"]
	
	%....Find != ......
	construct NotEquals[EqualityOp*]
	_ [getNotEqual  each EqualityOps ]
	construct _ [number]
	_ [length NotEquals] [putp "NotEquals: %"]

	
	%....Find !== ......
	construct NotDoubleEquals[EqualityOp*]
	_ [getNotDoubleEqual  each EqualityOps ]
	construct _ [number]
	_ [length NotDoubleEquals] [putp "NotIdentical: %"]

	%==================================================
	% Find use of Inequality operator
	%===================================================
    construct InEqualityOps[InequalityOp*]
	_ [^ PHPProgram]
    construct _ [number]
 	_ [length InEqualityOps] [putp "TotalInEqualityOps: %"]
	
	%....Find <> ......
	construct NotEqualsUsingAngle[InequalityOp*]
	_ [getNotEualUsingAngle  each InEqualityOps ]
	construct _ [number]
	_ [length NotEqualsUsingAngle] [putp "NotEqualUsingAngle: %"]
	
	%==================================================
	% Find ArrayKey '=>
	%===================================================	
    construct ArrayKeys[ArrayKey*]
	_ [^ PHPProgram]
    construct _ [number]
 	_ [length ArrayKeys] [putp "ArrayKey: %"]
	
	%==================================================
	% Array calls
	%===================================================
    construct ArrayCalls[Array*]
	_ [^ PHPProgram]
    construct _ [number]
 	_ [length ArrayCalls] [putp "ArrayCalls: %"]
	
	%==================================================
	% Variable or Function call
	%===================================================
    construct ObjectCVars[ObjectCVar*]
	_ [^ PHPProgram]
    construct _ [number]
 	_ [length ObjectCVars] [putp "ObjectCVars: %"]
	
	%....Annonymous create_function......
	construct CreateFunctions[ObjectCVar*]
	_ [getCreateFunction  each ObjectCVars ]
	construct _ [number]
	_ [length CreateFunctions] [putp "create_function(): %"]	
	
	%....print_r.. debug funciton......skip
	construct PrintR[ObjectCVar*]
	_ [getPrintR  each ObjectCVars ]
	construct _ [number]
	_ [length PrintR] [putp "print_r(): %"]
	
	%....array_unshift......
	construct ArrayUnshifts[ObjectCVar*]
	_ [getArrayUnshift  each ObjectCVars ]
	construct _ [number]
	_ [length ArrayUnshifts] [putp "array_unshift(): %"]

	%....array_shift......
	construct ArrayShifts[ObjectCVar*]
	_ [getArrayShift  each ObjectCVars ]
	construct _ [number]
	_ [length ArrayShifts] [putp "array_shift(): %"]

	%....array_push......
	construct ArrayPushes[ObjectCVar*]
	_ [getArrayPush  each ObjectCVars ]
	construct _ [number]
	_ [length ArrayPushes] [putp "arrat_push(): %"]

	%....array_pop......
	construct ArrayPops[ObjectCVar*]
	_ [getArrayPop  each ObjectCVars ]
	construct _ [number]
	_ [length ArrayPops] [putp "array_pop(): %"]

	%....array_splice......
	construct ArraySplices[ObjectCVar*]
	_ [getArraySplice  each ObjectCVars ]
	construct _ [number]
	_ [length ArraySplices] [putp "array_splice(): %"]
	
	%....list()...... is it an array only func or not?
	construct ListCalls[List*]
	_ [^ PHPProgram]
	construct _ [number]
	_ [length ListCalls] [putp "ListCalls(): %"]
	
	%....arrayDiff().....
	construct arrayDiffCalls[ObjectCVar*]
	_ [getArrayDiffCalls  each ObjectCVars ]
	construct _ [number]
	_ [length arrayDiffCalls] [putp "ArrayDiffCalls(): %"]
	
	%....varDump.....
	construct varDumpCalls[ObjectCVar*]
	_ [getVarDumpCalls  each ObjectCVars ]
	construct _ [number]
	_ [length varDumpCalls] [putp "varDumpCalls(): %"]
	
	%....fmod().....
	construct fModCalls[ObjectCVar*]
	_ [getfModCalls  each ObjectCVars ]
	construct _ [number]
	_ [length fModCalls] [putp "fModCalls(): %"]
	
	%....echo().....
	construct echoCalls[EchoStatement*]
	_ [^ PHPProgram]
	construct _ [number]
	_ [length echoCalls] [putp "echoCalls(): %"]
	
	%....print().....
	construct printCalls[PrintStatement*]
	_ [^ PHPProgram]
	construct _ [number]
	_ [length printCalls] [putp "printCalls(): %"]
	
	%....printf().....
	construct printfCalls[ObjectCVar*]
	_ [getPrintfCalls  each ObjectCVars ]
	construct _ [number]
	_ [length printfCalls] [putp "printfCalls(): %"]	
	
	%....vprintf().....
	construct vprintfCalls[ObjectCVar*]
	_ [getVprintfCalls  each ObjectCVars ]
	construct _ [number]
	_ [length vprintfCalls] [putp "vprintfCalls(): %"]
	

	%==================================================
	% Logical And OR
	%===================================================
	construct logicaAnds[LogicalAndAssignmentExpr*]
	_ [^ PHPProgram]
	construct _ [number]
	_ [length logicaAnds] [putp "LogicalAnd: %"]
	
	construct logicalOrs[OrLogicalXorExpr*]
	_ [^ PHPProgram]
	construct _ [number]
	_ [length logicalOrs] [putp "LogicalOr: %"]

	%==================================================
	% Conditional && ||
	%===================================================
	construct ConditionalAnds[ConditionalAndBitOrExpr*]
	_ [^ PHPProgram]
	construct _ [number]
	_ [length ConditionalAnds] [putp "ConditionalAnds: %"]	
	
	construct ConditionalOrs[ConditionalOrConditionalAndExpr*]
	_ [^ PHPProgram]
	construct _ [number]
	_ [length ConditionalOrs] [putp "ConditionalOrs: %"]
	
	
end function



% <<Same type of functions for different purposes>>


function getMagicFileConstant CurrentMagicConstant[MagicConstant]
	replace [MagicConstant*]
		PreviousMagicConstant[MagicConstant*]
		
		deconstruct CurrentMagicConstant
		'__FILE__
	by
		PreviousMagicConstant[.CurrentMagicConstant]		
end function

function getMagicDirConstant CurrentMagicConstant[MagicConstant]
	replace [MagicConstant*]
		PreviousMagicConstant[MagicConstant*]
		
		deconstruct CurrentMagicConstant
		'__DIR__
	by
		PreviousMagicConstant[.CurrentMagicConstant]		
end function

function getMagicFunctionConstant CurrentMagicConstant[MagicConstant]
	replace [MagicConstant*]
		PreviousMagicConstant[MagicConstant*]
		
		deconstruct CurrentMagicConstant
		'__FUNCTION__
	by
		PreviousMagicConstant[.CurrentMagicConstant]		
end function

function getMagicClassConstant CurrentMagicConstant[MagicConstant]
	replace [MagicConstant*]
		PreviousMagicConstant[MagicConstant*]
		
		deconstruct CurrentMagicConstant
		'__CLASS__
	by
		PreviousMagicConstant[.CurrentMagicConstant]		
end function

function getMagicMethodConstant CurrentMagicConstant[MagicConstant]
	replace [MagicConstant*]
		PreviousMagicConstant[MagicConstant*]
		
		deconstruct CurrentMagicConstant
		'__METHOD__
	by
		PreviousMagicConstant[.CurrentMagicConstant]		
end function
function getMagicLineConstant CurrentMagicConstant[MagicConstant]
	replace [MagicConstant*]
		PreviousMagicConstant[MagicConstant*]
		
		deconstruct CurrentMagicConstant
		'__LINE__
	by
		PreviousMagicConstant[.CurrentMagicConstant]		
end function
function getMagicNameSpaceConstant CurrentMagicConstant[MagicConstant]
	replace [MagicConstant*]
		PreviousMagicConstant[MagicConstant*]
		
		deconstruct CurrentMagicConstant
		'__NAMESPACE__
	by
		PreviousMagicConstant[.CurrentMagicConstant]		
end function




function getArrayDiffCalls CurrentObjectCVar[ObjectCVar]
	replace [ObjectCVar*]
		PreviousObjectCVars[ObjectCVar*]

		deconstruct CurrentObjectCVar
		_[opt ClassNameColonColon] 'array_diff _[opt CallParams] _[ArrowObjectProperty*]
	by
		PreviousObjectCVars[.CurrentObjectCVar]		
end function

function getVarDumpCalls CurrentObjectCVar[ObjectCVar]
	replace [ObjectCVar*]
		PreviousObjectCVars[ObjectCVar*]

		deconstruct CurrentObjectCVar
		_[opt ClassNameColonColon] 'var_dump _[opt CallParams] _[ArrowObjectProperty*]
	by
		PreviousObjectCVars[.CurrentObjectCVar]		
end function


function getfModCalls CurrentObjectCVar[ObjectCVar]
	replace [ObjectCVar*]
		PreviousObjectCVars[ObjectCVar*]

		deconstruct CurrentObjectCVar
		_[opt ClassNameColonColon] 'fmod _[opt CallParams] _[ArrowObjectProperty*]
	by
		PreviousObjectCVars[.CurrentObjectCVar]		
end function

function getVprintfCalls CurrentObjectCVar[ObjectCVar]
	replace [ObjectCVar*]
		PreviousObjectCVars[ObjectCVar*]

		deconstruct CurrentObjectCVar
		_[opt ClassNameColonColon] 'vprintf _[opt CallParams] _[ArrowObjectProperty*]
	by
		PreviousObjectCVars[.CurrentObjectCVar]		
end function

function getPrintfCalls CurrentObjectCVar[ObjectCVar]
	replace [ObjectCVar*]
		PreviousObjectCVars[ObjectCVar*]

		deconstruct CurrentObjectCVar
		_[opt ClassNameColonColon] 'printf _[opt CallParams] _[ArrowObjectProperty*]
	by
		PreviousObjectCVars[.CurrentObjectCVar]		
end function


function getCreateFunction CurrentObjectCVar[ObjectCVar]
	replace [ObjectCVar*]
		PreviousObjectCVars[ObjectCVar*]

		deconstruct CurrentObjectCVar
		_[opt ClassNameColonColon] 'create_function _[opt CallParams] _[ArrowObjectProperty*]
	by
		PreviousObjectCVars[.CurrentObjectCVar]		
end function

function getArrayUnshift CurrentObjectCVar[ObjectCVar]
	replace [ObjectCVar*]
		PreviousObjectCVars[ObjectCVar*]

		deconstruct CurrentObjectCVar
		_[opt ClassNameColonColon] 'array_unshift _[opt CallParams] _[ArrowObjectProperty*]
	by
		PreviousObjectCVars[.CurrentObjectCVar]		
end function

function getArrayShift CurrentObjectCVar[ObjectCVar]
	replace [ObjectCVar*]
		PreviousObjectCVars[ObjectCVar*]

		deconstruct CurrentObjectCVar
		_[opt ClassNameColonColon] 'array_shift _[opt CallParams] _[ArrowObjectProperty*]
	by
		PreviousObjectCVars[.CurrentObjectCVar]		
end function

function getArrayPush CurrentObjectCVar[ObjectCVar]
	replace [ObjectCVar*]
		PreviousObjectCVars[ObjectCVar*]

		deconstruct CurrentObjectCVar
		_[opt ClassNameColonColon] 'array_push _[opt CallParams] _[ArrowObjectProperty*]
	by
		PreviousObjectCVars[.CurrentObjectCVar]		
end function

function getArrayPop CurrentObjectCVar[ObjectCVar]
	replace [ObjectCVar*]
		PreviousObjectCVars[ObjectCVar*]

		deconstruct CurrentObjectCVar
		_[opt ClassNameColonColon] 'array_pop _[opt CallParams] _[ArrowObjectProperty*]
	by
		PreviousObjectCVars[.CurrentObjectCVar]		
end function

function getArraySplice CurrentObjectCVar[ObjectCVar]
	replace [ObjectCVar*]
		PreviousObjectCVars[ObjectCVar*]

		deconstruct CurrentObjectCVar
		_[opt ClassNameColonColon] 'array_splice _[opt CallParams] _[ArrowObjectProperty*]
	by
		PreviousObjectCVars[.CurrentObjectCVar]		
end function

function getPrintR CurrentObjectCVar[ObjectCVar]
	replace [ObjectCVar*]
		PreviousObjectCVars[ObjectCVar*]

		deconstruct CurrentObjectCVar
		_[opt ClassNameColonColon] 'print_r _[opt CallParams] _[ArrowObjectProperty*]
	by
		PreviousObjectCVars[.CurrentObjectCVar]		
end function


function getNotEualUsingAngle CurrentEqualityOp[InequalityOp]
	replace [InequalityOp*]
		PreviousEqualityOps[InequalityOp*]

		deconstruct CurrentEqualityOp
		'<>
	by
		PreviousEqualityOps[.CurrentEqualityOp]		
end function

function getDoubleEqual CurrentEqualityOp[EqualityOp]
	replace [EqualityOp*]
		PreviousEqualityOps[EqualityOp*]

		deconstruct CurrentEqualityOp
		'==
	by
		PreviousEqualityOps[.CurrentEqualityOp]		
end function

function getTripleEqual CurrentEqualityOp[EqualityOp]
	replace [EqualityOp*]
		PreviousEqualityOps[EqualityOp*]

		deconstruct CurrentEqualityOp
		'===
	by
		PreviousEqualityOps[.CurrentEqualityOp]		
end function

function getNotEqual CurrentEqualityOp[EqualityOp]
	replace [EqualityOp*]
		PreviousEqualityOps[EqualityOp*]

		deconstruct CurrentEqualityOp
		'!=
	by
		PreviousEqualityOps[.CurrentEqualityOp]		
end function

function getNotDoubleEqual CurrentEqualityOp[EqualityOp]
	replace [EqualityOp*]
		PreviousEqualityOps[EqualityOp*]

		deconstruct CurrentEqualityOp
		'!==
	by
		PreviousEqualityOps[.CurrentEqualityOp]		
end function


function getForEachWithColon CurrentForEachStmt[ForEachStatement]
	replace [ForEachStatement*]
		PreviousForEachWithColon[ForEachStatement*]

		deconstruct CurrentForEachStmt
		'foreach '( _[Expr] 'as _[ForEachPattern] ') ': 
            _[Statement*]
        'endforeach _[opt ';]
	by
		PreviousForEachWithColon[.CurrentForEachStmt]		
end function

function getForEachWithoutColon CurrentForEachStmt[ForEachStatement]
	replace [ForEachStatement*]
		PreviousForEachWithoutColon[ForEachStatement*]
		
		deconstruct CurrentForEachStmt
        'foreach '( _[Expr] 'as _[ForEachPattern] ')
            _[Statement]
	by
		PreviousForEachWithoutColon[.CurrentForEachStmt]		
end function



function getSwitchWithColon CurrentSwitchStmt[SwitchStatement]
	replace [SwitchStatement*]
		PreviousSwitchWithColon[SwitchStatement*]

		deconstruct CurrentSwitchStmt
        'switch '( _[Expr] ') ': _[opt ';]
            _[Case*]
        'endswitch _[opt ';]
	by
		PreviousSwitchWithColon[.CurrentSwitchStmt]		
end function

function getSwitchWithoutColon CurrentSwitchStmt[SwitchStatement]
	replace [SwitchStatement*]
		PreviousSwitchWithoutColon[SwitchStatement*]
		
		deconstruct CurrentSwitchStmt
        'switch '( _[Expr] ')
            '{ _[opt ';]
            _[Case*]
        '} _[opt ';]
	by
		PreviousSwitchWithoutColon[.CurrentSwitchStmt]		
end function


function getForWithColon CurrentForStmt[ForStatement]
	replace [ForStatement*]
		PreviousForWithColon[ForStatement*]

		deconstruct CurrentForStmt
        'for '( _[Expr,] '; _[Expr,] '; _[Expr,] ') ':
            _[Statement*]
        'endfor _[opt ';]
	by
		PreviousForWithColon[.CurrentForStmt]		
end function

function getForWithoutColon CurrentForStmt[ForStatement]
	replace [ForStatement*]
		PreviousForWithoutColon[ForStatement*]
		
		deconstruct CurrentForStmt
        'for '( _[Expr,] '; _[Expr,] '; _[Expr,] ')
            _[Statement]
	by
		PreviousForWithoutColon[.CurrentForStmt]		
end function





function getWhileWithColon CurrentWhileStmt[WhileStatement]
	replace [WhileStatement*]
		PreviousWhileWithColon[WhileStatement*]

		deconstruct CurrentWhileStmt
        'while '( _[Expr] ') ':
            _[TopStatement*]
        'endwhile _[opt ';]		
	by
		PreviousWhileWithColon[.CurrentWhileStmt]		
end function

function getWhileWithoutColon CurrentWhileStmt[WhileStatement]
	replace [WhileStatement*]
		PreviousWhileWithoutColon[WhileStatement*]
		
		deconstruct CurrentWhileStmt
        'while '( _[Expr] ')
            _[Statement]		
	by
		PreviousWhileWithoutColon[.CurrentWhileStmt]		
end function




function getIfStmtsWithColon CurrentIfStmt[IfStatement]
	replace [IfStatement*]
		PreviousIfStmtsWithColon[IfStatement*]
		
		deconstruct CurrentIfStmt
        'if '( _[Expr] ') ':
            _[TopStatement*]
        _[AltElseifStatement*] 
        _[AltElseStatement?] 
        'endif _[opt ';]
	by
		PreviousIfStmtsWithColon[.CurrentIfStmt]		
end function

function getIfStmtsWithoutColon CurrentIfStmt[IfStatement]
	replace [IfStatement*]
		PreviousIfStmtsWithoutColon[IfStatement*]
		
		deconstruct CurrentIfStmt
        'if '( _[Expr] ')
	    _[Statement]
	    _[ElseIfStatement*] 
	    _[ElseStatement?]
	by
		PreviousIfStmtsWithoutColon[.CurrentIfStmt]		
end function



function getHeredocOperator CurrentString[StringConstant]
	replace [StringConstant*]
		PreviousHeredocs[StringConstant*]
		
		deconstruct CurrentString
		'<<< _[push id] _[repeat EncapsedInlineHTML] _[pop id]
	by
		PreviousHeredocs[.CurrentString]		
end function



function getImplodeCall CurrentId[id]
	replace [id*]
		PreviousIds[id*]
		
		deconstruct CurrentId
		'implode
	by
		PreviousIds[.CurrentId]		
end function


function getExplodeCall CurrentId[id]
	replace [id*]
		PreviousIds[id*]
		
		deconstruct CurrentId
		'explode
	by
		PreviousIds[.CurrentId]		
end function


function getConstructDecls CurrentFuncDecl[FunctionDecl]
	replace [FunctionDecl*]
		PreviousFunctionDecl[FunctionDecl*]
		
		deconstruct CurrentFuncDecl
		'function _[opt '&] '__construct '( _[Param,] ')
        _[Block]
	by
		PreviousFunctionDecl[.CurrentFuncDecl]		
end function

function getDestructDecls CurrentFuncDecl[FunctionDecl]
	replace [FunctionDecl*]
		PreviousFunctionDecl[FunctionDecl*]
		
		deconstruct CurrentFuncDecl
		'function _[opt '&] '__destruct '( _[Param,] ')
        _[Block]
	by
		PreviousFunctionDecl[.CurrentFuncDecl]		
end function

function getCallDecls CurrentFuncDecl[FunctionDecl]
	replace [FunctionDecl*]
		PreviousFunctionDecl[FunctionDecl*]
		
		deconstruct CurrentFuncDecl
		'function _[opt '&] '__call '( _[Param,] ')
        _[Block]
	by
		PreviousFunctionDecl[.CurrentFuncDecl]		
end function

function getCallStaticDecls CurrentFuncDecl[FunctionDecl]
	replace [FunctionDecl*]
		PreviousFunctionDecl[FunctionDecl*]
		
		deconstruct CurrentFuncDecl
		'function _[opt '&] '__callStatic '( _[Param,] ')
        _[Block]
	by
		PreviousFunctionDecl[.CurrentFuncDecl]		
end function


function getGetDecls CurrentFuncDecl[FunctionDecl]
	replace [FunctionDecl*]
		PreviousFunctionDecl[FunctionDecl*]
		
		deconstruct CurrentFuncDecl
		'function _[opt '&] '__get '( _[Param,] ')
        _[Block]
	by
		PreviousFunctionDecl[.CurrentFuncDecl]		
end function

function getSetDecls CurrentFuncDecl[FunctionDecl]
	replace [FunctionDecl*]
		PreviousFunctionDecl[FunctionDecl*]
		
		deconstruct CurrentFuncDecl
		'function _[opt '&] '__set '( _[Param,] ')
        _[Block]
	by
		PreviousFunctionDecl[.CurrentFuncDecl]		
end function

function getIssetDecls CurrentFuncDecl[FunctionDecl]
	replace [FunctionDecl*]
		PreviousFunctionDecl[FunctionDecl*]
		
		deconstruct CurrentFuncDecl
		'function _[opt '&] '__isset '( _[Param,] ')
        _[Block]
	by
		PreviousFunctionDecl[.CurrentFuncDecl]		
end function

function getUnsetDecls CurrentFuncDecl[FunctionDecl]
	replace [FunctionDecl*]
		PreviousFunctionDecl[FunctionDecl*]
		
		deconstruct CurrentFuncDecl
		'function _[opt '&] '__unset '( _[Param,] ')
        _[Block]
	by
		PreviousFunctionDecl[.CurrentFuncDecl]		
end function


function getSleepDecls CurrentFuncDecl[FunctionDecl]
	replace [FunctionDecl*]
		PreviousFunctionDecl[FunctionDecl*]
		
		deconstruct CurrentFuncDecl
		'function _[opt '&] '__sleep '( _[Param,] ')
        _[Block]
	by
		PreviousFunctionDecl[.CurrentFuncDecl]		
end function

function getWakeUpDecls CurrentFuncDecl[FunctionDecl]
	replace [FunctionDecl*]
		PreviousFunctionDecl[FunctionDecl*]
		
		deconstruct CurrentFuncDecl
		'function _[opt '&] '__wakeup '( _[Param,] ')
        _[Block]
	by
		PreviousFunctionDecl[.CurrentFuncDecl]		
end function

function getToStringDecls CurrentFuncDecl[FunctionDecl]
	replace [FunctionDecl*]
		PreviousFunctionDecl[FunctionDecl*]
		
		deconstruct CurrentFuncDecl
		'function _[opt '&] '__toString '( _[Param,] ')
        _[Block]
	by
		PreviousFunctionDecl[.CurrentFuncDecl]		
end function

function getInvokeDecls CurrentFuncDecl[FunctionDecl]
	replace [FunctionDecl*]
		PreviousFunctionDecl[FunctionDecl*]
		
		deconstruct CurrentFuncDecl
		'function _[opt '&] '__invoke '( _[Param,] ')
        _[Block]
	by
		PreviousFunctionDecl[.CurrentFuncDecl]		
end function

function getSetStateDecls CurrentFuncDecl[FunctionDecl]
	replace [FunctionDecl*]
		PreviousFunctionDecl[FunctionDecl*]
		
		deconstruct CurrentFuncDecl
		'function _[opt '&] '__set_state '( _[Param,] ')
        _[Block]
	by
		PreviousFunctionDecl[.CurrentFuncDecl]		
end function

function getCloneDecls CurrentFuncDecl[FunctionDecl]
	replace [FunctionDecl*]
		PreviousFunctionDecl[FunctionDecl*]
		
		deconstruct CurrentFuncDecl
		'function _[opt '&] '__clone '( _[Param,] ')
        _[Block]
	by
		PreviousFunctionDecl[.CurrentFuncDecl]		
end function


function getAutoLoadDecls CurrentFuncDecl[FunctionDecl]
	replace [FunctionDecl*]
		PreviousFunctionDecl[FunctionDecl*]
		
		deconstruct CurrentFuncDecl
		'function _[opt '&] '__autoload '( _[Param,] ')
        _[Block]
	by
		PreviousFunctionDecl[.CurrentFuncDecl]		
end function



function getDebugInfoDecls CurrentFuncDecl[FunctionDecl]
	replace [FunctionDecl*]
		PreviousFunctionDecl[FunctionDecl*]
		
		deconstruct CurrentFuncDecl
		'function _[opt '&] '__debugInfo '( _[Param,] ')
        _[Block]
	by
		PreviousFunctionDecl[.CurrentFuncDecl]		
end function

function getNewCalls CurrentInternalFunc[InternalFunction]
	replace [InternalFunction*]
		PreviousInternal[InternalFunction*]
		
		deconstruct CurrentInternalFunc
		'new _[Primary]
	by
		PreviousInternal[.CurrentInternalFunc]		
end function


function getCloneCalls CurrentInternalFunc[InternalFunction]
	replace [InternalFunction*]
		PreviousInternal[InternalFunction*]
		
		deconstruct CurrentInternalFunc
		'clone _[Primary]
	by
		PreviousInternal[.CurrentInternalFunc]		
end function

function getIssetCalls CurrentInternalFunc[InternalFunction]
	replace [InternalFunction*]
		PreviousInternal[InternalFunction*]
		
		deconstruct CurrentInternalFunc
		'isset '( _[ObjectCVar,+] ')
	by
		PreviousInternal[.CurrentInternalFunc]		
end function

function getEmptyCalls CurrentInternalFunc[InternalFunction]
	replace [InternalFunction*]
		PreviousInternal[InternalFunction*]
		
		deconstruct CurrentInternalFunc
		'empty '( _[ObjectCVar] ')
	by
		PreviousInternal[.CurrentInternalFunc]		
end function

function getIntvalCalls CurrentInternalFunc[InternalFunction]
	replace [InternalFunction*]
		PreviousInternal[InternalFunction*]
		
		deconstruct CurrentInternalFunc
		'intval '( _[ObjectCVar] ')
	by
		PreviousInternal[.CurrentInternalFunc]		
end function

function getEvalCalls CurrentInternalFunc[InternalFunction]
	replace [InternalFunction*]
		PreviousInternal[InternalFunction*]
		
		deconstruct CurrentInternalFunc
		'eval '( _[Expr] ')
	by
		PreviousInternal[.CurrentInternalFunc]		
end function

function getExitCalls CurrentInternalFunc[InternalFunction]
	replace [InternalFunction*]
		PreviousInternal[InternalFunction*]
		
		deconstruct CurrentInternalFunc
		'exit  _[opt exit_value]
	by
		PreviousInternal[.CurrentInternalFunc]		
end function

function getIncludeCalls CurrentInternalFunc[InternalFunction]
	replace [InternalFunction*]
		PreviousInternal[InternalFunction*]
		
		deconstruct CurrentInternalFunc
		'include _[Expr]
	by
		PreviousInternal[.CurrentInternalFunc]		
end function

function getIncludeOnceCalls CurrentInternalFunc[InternalFunction]
	replace [InternalFunction*]
		PreviousInternal[InternalFunction*]
		
		deconstruct CurrentInternalFunc
		'include_once _[Expr]
	by
		PreviousInternal[.CurrentInternalFunc]		
end function

function getRequireCalls CurrentInternalFunc[InternalFunction]
	replace [InternalFunction*]
		PreviousInternal[InternalFunction*]
		
		deconstruct CurrentInternalFunc
		'require _[Expr]
	by
		PreviousInternal[.CurrentInternalFunc]		
end function

function getRequireOnceCalls CurrentInternalFunc[InternalFunction]
	replace [InternalFunction*]
		PreviousInternal[InternalFunction*]
		
		deconstruct CurrentInternalFunc
		'require_once _[Expr]
	by
		PreviousInternal[.CurrentInternalFunc]		
end function


function getUseCalls CurrentInternalFunc[InternalFunction]
	replace [InternalFunction*]
		PreviousInternal[InternalFunction*]
		
		deconstruct CurrentInternalFunc
		'use _[list UseName+]
	by
		PreviousInternal[.CurrentInternalFunc]		
end function
%-------