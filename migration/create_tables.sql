-- ============================================================
-- 月底库存管理 - 新 Supabase 建表脚本
-- ============================================================

-- 1. 库存表
CREATE TABLE IF NOT EXISTS inventory (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    period text NOT NULL,
    material_code text NOT NULL,
    material_name text,
    unit text,
    jiecun numeric,
    diankv numeric,
    updated_at timestamptz DEFAULT now(),
    UNIQUE (period, material_code)
);

-- 2. 规则表
CREATE TABLE IF NOT EXISTS rules (
    material_code text PRIMARY KEY,
    material_name text,
    unit text,
    attribute text,
    ganlia numeric,
    shiliao numeric,
    shushi numeric,
    xiancai numeric,
    douyou numeric,
    yuangongcan numeric
);

-- 3. 索引（加速查询）
CREATE INDEX IF NOT EXISTS idx_inventory_period ON inventory(period);
CREATE INDEX IF NOT EXISTS idx_inventory_code ON inventory(material_code);
