local patterns = {
        -- Basic Patterns
        "Mind's Reflection",
        "Compass' Purification",
        "Compass' Purification II",
        "Alidade's Purification",
        "Archer's Distillation",
        "Architect's Distillation",
        "Scout's Distillation",
        "Reveal",
        "Stadiometer's Purification",
        "Pace Purification",
        
        -- Hexal Basic Patterns
        "Timekeeper's Reflection",
        "Thanatos' Reflection",
        "Diver's Purification",
        "Nurse's Purification",
        "Squire's Purification",
        "Boxer's Purification",
        "Lamplighter's Purification",
        
        -- Number Literals
        "Numerical Reflection: 1",
        "Numerical Reflection: 2",
        "Numerical Reflection: 3",
        "Numerical Reflection: 4",
        "Numerical Reflection: 5",
        "Numerical Reflection: 6",
        "Numerical Reflection: 7",
        "Numerical Reflection: 8",
        "Numerical Reflection: 9",
        "Numerical Reflection: 10",
        "Numerical Reflection: -1",
        "Numerical Reflection: 0",
        
        -- Mathematics
        "Additive Distillation",
        "Subtractive Distillation",
        "Multiplicative Distillation",
        "Division Distillation",
        "Length Purification",
        "Power Distillation",
        "Floor Purification",
        "Ceiling Purification",
        "Vector Exaltation",
        "Vector Disintegration",
        "Modulus Distillation",
        "Axial Purification",
        "Entropy Reflection",
        
        -- Constants
        "True Reflection",
        "False Reflection",
        "Nullary Reflection",
        "Vector Reflection Zero",
        "Vector Reflection +X",
        "Vector Reflection -X",
        "Vector Reflection +Y",
        "Vector Reflection -Y",
        "Vector Reflection +Z",
        "Vector Reflection -Z",
        "Circle's Reflection",
        "Arc's Reflection",
        "Euler's Reflection",
        
        -- Hexal Maths
        "Factorial Purification",
        "Running Sum Purification",
        "Running Product Purification",
        
        -- Stack Manipulation
        "Novice's Gambit",
        "Jester's Gambit",
        "Rotation Gambit",
        "Rotation Gambit II",
        "Gemini Decomposition",
        "Prospector's Gambit",
        "Undertaker's Gambit",
        "Gemini Gambit",
        "Dioscuri Gambit",
        "Flock's Reflection",
        "Fisherman's Gambit",
        "Fisherman's Gambit II",
        "Swindler's Gambit",
        
        -- Logical Operators
        "Negation Purification",
        "Augur's Purification",
        "Disjunction Distillation",
        "Conjuction Distillation",
        "Exclusion Distillation",
        "Augur's Exaltion",
        "Equality Distillation",
        "Inequality Distillation",
        "Maximus Distillation",
        "Minimus Distillation",
        "Maximus Distillation II",
        "Minimus Distillation II",
        
        -- Types
        "Classifier's Purification",
        "Physician's Purification",
        "Sorter's Purification",
        "Sorter's Reflection",
        "Entity Distillation: Type",
        "Zone Exaltation: Type",
        "Zone Exaltation: Non-Type",
        
        -- Entities
        "Entity Purification",
        "Entity Purification: Animal",
        "Entity Purification: Monster",
        "Entity Purification: Item",
        "Entity Purification: Player",
        "Entity Purification: Living",
        "Zone Distillation: Animal",
        "Zone Distillation: Non-Animal",
        "Zone Distillation: Monster",
        "Zone Distillation: Non-Monster",
        "Zone Distillation: Item",
        "Zone Distillation: Non-Item",
        "Zone Distillation: Player",
        "Zone Distillation: Non-Player",
        "Zone Distillation: Living",
        "Zone Distillation: Non-Living",
        "Zone Distillation: Any",
        
        -- List Manipulation
        "Selection Distillation",
        "Selection Exaltation",
        "Integration Distillation",
        "Combination Distillation",
        "Vacant Reflection",
        "Single's Purification",
        "Abacus Purification",
        "Retrograde Purification",
        "Locator's Distillation",
        "Excisor's Distillation",
        "Surgeon's Exaltation",
        "Flock's Gambit",
        "Flock's Disintegration",
        "Speaker's Distillation",
        "Speaker's Decomposition",
        
        -- Patterns as Iotas
        "Consideration",
        "Introspection",
        "Retrospection",
        
        -- Reading and Writing
        "Scribe's Reflection",
        "Scribe's Gambit",
        "Chronicler's Purification",
        "Chronicler's Gambit",
        "Auditor's Reflection",
        "Auditor's Purification",
        "Assessor's Reflection",
        "Assessor's Purification",
        "Huginn's Gambit",
        "Muninn's Reflection",
        
        -- Advanced Mathematics
        "Sine Purification",
        "Cosine Purification",
        "Tangent Purification",
        "Inverse Sine Purification",
        "Inverse Cosine Purification",
        "Inverse Tangent Purification",
        "Logarithmic Distillation",
        
        -- Sets
        "Unifying Distillation",
        "Intersection Distillation",
        "Exclusionary Distillation",
        "Inversion Purification",
        "Uniqueness Purification",
        
        -- Meta-Evaluation
        "Hermes' Gambit",
        "Thoth's Gambit",
        "Charon's Gambit",
        
        -- Spell Circle patterns
        "Waystone Reflection",
        "Lodestone Reflection",
        "Lesser Fold Reflection",
        "Greater Fold Reflection",
        
        -- Akashic patterns
        "Akasha's Distillation",
        "Akasha's Gambit",
        
        -- Everbook
        "Mnemosyne's Gambit",
        "Elysium's Gambit",
        "Lethe's Gambit",
        "Brigh's Gambit",
        
        -- Basic Spells
        "Explosion",
        "Fireball",
        "Impulse",
        "Blink",
        "Make Note",
        
        -- Blockworks
        "Place Block",
        "Break Block",
        "Create Water",
        "Destroy Liquid",
        "Conjure Block",
        "Conjure Light",
        "Overgrow",
        "Edify Sapling",
        "Ignite Block",
        "Extinguish Area",
        
        -- Nadirs
        "White Sun's Nadir",
        "Blue Sun's Nadir",
        "Black Sun's Nadir",
        "Red Sun's Nadir",
        "Green Sun's Nadir",
        
        -- Crafting Casting Items
        "Craft Cypher",
        "Craft Trinket",
        "Craft Artifact",
        "Recharge Item",
        "Erase Item",
        
        -- Sentinels
        "Summon Sentinel",
        "Banish Sentinel",
        "Locate Sentinel",
        "Wayfind Sentinel",
        
        -- Internalize Pigment
        "Internalize Pigment",
        
        -- Hexal Spells
        "Smelt",
        "Freeze",
        "Falling Block",
        "Place Block II",
        "Particles",
        
        -- Wisps
        "Summon Projectile Wisp",
        "Summon Cyclic Wisp",
        "Identity Reflection",
        "Reservoir Reflection",
        "Manager's Purification",
        "Allegiance Distillation",
        "Pathfinder's Gambit",
        "Pathfinder's Reflection",
        "Haste",
        "Speedometer's Reflection",
        "Entity Purification: Wisp",
        "Zone Distillation: Wisp",
        "Zone Distillation: Non-Wisp",
        "Delay Wisp",
        "Listen",
        "Wander",
        
        -- Links
        "Link",
        "Link Others",
        "Unlink",
        "Unlink Others",
        "Phonebook Purification",
        "recognition Purification",
        "Popularity Reflection",
        "Send Iota",
        "Recitation Reflection",
        "Postmaster's Reflection",
        "Unclogging Gambit",
        "Open Transmit",
        "Close Transmit",
        
        -- Motes
        "Bind Storage",
        "Bind Storage - Temp",
        "Stocktake Reflection",
        "Stocktake Purification",
        "Capacity Reflection",
        "Mediafy Item",
        "Return Item",
        "Weighing Purification",
        "Stacking Distillation",
        "Stacking Distillation II",
        "Splitting Gambit",
        "Depot Purification",
        "Depot Gambit",
        "Craft",
        "Seniority Purification",
        "Offering Purification",
        "Trade",
        "Use Item On",
        
        -- Create Lava
        "Create Lava",
        
        -- Zeniths
        "White Sun's Zenith",
        "Blue Sun's Zenith",
        "Black Sun's Zenith",
        "Red Sun's Zenith",
        "Green Sun's Zenith",
        
        -- Weather Manipulation
        "Summon Lightning",
        "Summon Rain",
        "Dispel Rain",
        
        -- Flight
        "Flight",
        
        -- Greater Teleportation
        "Greater Teleport",
        
        -- Summon Greater Sentinel
        "Summon Greater Sentinel", -- 1
        
        -- Craft Phial
        "Craft Phial",
        
        -- Flay Mind
        "Flay Mind",
        
        -- Accelerate
        "Accelerate",
        
        -- Great Wisp Spells
        "Consume Wisp",
        "Bind Wisp",
        "Familiar's Reflection",
        
        -- Gates
        "Gate's Reflection",
        "Gate's Opening",
        "Gate's Dismissal",
        "Marked Purification",
        "Marked Distillation",
        "Gate's Closing",
        }


return patterns