# Agent Workflow Skills

个人维护的 AI 编程工作流：行为与实施方案分离，按改动验证，以证据交接。`v2-*` 保留为兼容入口；仓库发布版本独立维护，当前为 `0.1.0`。

基于 [tt-a1i/matt-skills-with-to-goal](https://github.com/tt-a1i/matt-skills-with-to-goal) `1.3.1-to-goal.1`（`d09351e`），原始技能来自 [mattpocock/skills](https://github.com/mattpocock/skills)。保留上游历史和 MIT 许可。

## 选择工作方式

| 情况 | 方法 |
|---|---|
| 小而明确的修改 | 直接实现，不强制规划流程 |
| 已确定行为和技术方案，需要持久化 | `v2-to-spec` 生成版本一致的双文件 |
| 双文件已批准，可以执行 | `v2-spec-executor`，可直接执行或使用已授权的 fork |
| 需要独立交付或多所有者协作 | `v2-to-tickets` |
| 需要跨上下文搬运一个执行单元 | `v2-to-goal` |

详见 [设计](docs/v2/design.md)、[上游吸收记录](docs/v2/upstream-review.md)和[维护说明](docs/maintaining-fork.md)。不要同时加载旧源和本仓库的同名技能。原版技能保留其上游行为，包括部分原版的全量测试与提交指令；个人双文件工作优先使用 `v2-*`，项目规则始终优先。

## 安装

Claude Code：

```bash
claude plugin marketplace add Alt3rmis/agent-workflow-skills
claude plugin install agent-workflow-skills@alt3rmis
```

Codex 和其他支持 Agent Skills 的工具：

```bash
npx skills@latest add Alt3rmis/agent-workflow-skills
```

建议只安装需要的技能，例如：

```bash
npx skills@latest add Alt3rmis/agent-workflow-skills --skill=v2-spec-executor
```

选择一种安装方式，避免重复加载。创建或更新本仓库不会自动修改个人已安装技能或消费项目中的固定副本。

## 技能目录

保留全部上游技能；双文件技能为本仓库维护的派生版本。以下按原有调用策略列出。

### User-invoked

- [`ask-matt`](./skills/engineering/ask-matt/SKILL.md)。
- [`grill-with-docs`](./skills/engineering/grill-with-docs/SKILL.md)。
- [`implement`](./skills/engineering/implement/SKILL.md)。
- [`implement-spec`](./skills/engineering/implement-spec/SKILL.md)。
- [`improve-codebase-architecture`](./skills/engineering/improve-codebase-architecture/SKILL.md)。
- [`retro`](./skills/engineering/retro/SKILL.md)。
- [`roundtable`](./skills/engineering/roundtable/SKILL.md)。
- [`setup-matt-pocock-skills`](./skills/engineering/setup-matt-pocock-skills/SKILL.md)。
- [`to-goal`](./skills/engineering/to-goal/SKILL.md)。
- [`to-spec`](./skills/engineering/to-spec/SKILL.md)。
- [`to-tickets`](./skills/engineering/to-tickets/SKILL.md)。
- [`triage`](./skills/engineering/triage/SKILL.md)。
- [`v2-to-goal`](./skills/engineering/v2-to-goal/SKILL.md)：双文件工作流。
- [`v2-to-spec`](./skills/engineering/v2-to-spec/SKILL.md)：双文件工作流。
- [`v2-to-tickets`](./skills/engineering/v2-to-tickets/SKILL.md)：双文件工作流。
- [`wayfinder`](./skills/engineering/wayfinder/SKILL.md)。
- [`grill-me`](./skills/productivity/grill-me/SKILL.md)。
- [`handoff`](./skills/productivity/handoff/SKILL.md)。
- [`teach`](./skills/productivity/teach/SKILL.md)。
- [`to-questionnaire`](./skills/productivity/to-questionnaire/SKILL.md)。
- [`wait-what`](./skills/productivity/wait-what/SKILL.md)。

### Model-invoked

- [`code-review`](./skills/engineering/code-review/SKILL.md)。
- [`codebase-design`](./skills/engineering/codebase-design/SKILL.md)。
- [`diagnosing-bugs`](./skills/engineering/diagnosing-bugs/SKILL.md)。
- [`domain-modeling`](./skills/engineering/domain-modeling/SKILL.md)。
- [`execute-spec-in-fork`](./skills/engineering/execute-spec-in-fork/SKILL.md)。
- [`goal-crafter`](./skills/engineering/goal-crafter/SKILL.md)。
- [`pr`](./skills/engineering/pr/SKILL.md)。
- [`prototype`](./skills/engineering/prototype/SKILL.md)。
- [`research`](./skills/engineering/research/SKILL.md)。
- [`resolving-merge-conflicts`](./skills/engineering/resolving-merge-conflicts/SKILL.md)。
- [`spec-executor`](./skills/engineering/spec-executor/SKILL.md)。
- [`tdd`](./skills/engineering/tdd/SKILL.md)。
- [`v2-spec-executor`](./skills/engineering/v2-spec-executor/SKILL.md)：双文件工作流。
- [`wizard`](./skills/engineering/wizard/SKILL.md)。
- [`grilling`](./skills/productivity/grilling/SKILL.md)。
- [`writing-for-agents`](./skills/productivity/writing-for-agents/SKILL.md)。

## 许可

[MIT](LICENSE)。上游版权声明保留，个人派生规则的来源与评估基线见 [provenance.json](docs/v2/provenance.json)。
