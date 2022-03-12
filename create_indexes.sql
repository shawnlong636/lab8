CREATE INDEX NYC_PartNo
ON part_nyc 
USING BTREE (part_number);

CREATE INDEX SFO_PartNo
ON part_sfo
USING BTREE (part_number);

CREATE INDEX NYC_OnHand
ON part_nyc
USING BTREE (on_hand);

CREATE INDEX SFO_OnHand
ON part_nyc
USING BTREE (on_hand);

CREATE INDEX NYC_SupplierPartNo
ON part_nyc
USING BTREE (supplier, part_number);

CREATE INDEX SFO_SupplierPartNo
ON part_sfo
USING BTREE (supplier, part_number);